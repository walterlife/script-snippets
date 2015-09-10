#!/usr/bin/env python
# -*- coding=utf-8 -*-

import socket

class SocketClient():
    def __init__(self, host, port, timeout=None, verbose=False):
        self.host = host
        self.port = port
        self.timeout = timeout
        self.desc    = 'inited'
        self._connected = False
        self.verbose = verbose
        if self.verbose:
            print 'host={h}, port={p}, timeout={tm}'.format(h=self.host, p=self.port, tm=self.timeout)

    def connect(self):
        if not self._connected and isinstance(self.host, basestring) and isinstance(self.port, int):
            for res in socket.getaddrinfo(self.host, self.port, socket.AF_UNSPEC, socket.SOCK_STREAM):
                af, socktype, proto, canonname, sa = res
                try:
                    self._connector = socket.socket(af, socktype, proto)
                except socket.error as msg:
                    self._connector = None
                    self._connected = False
                    continue
                try:
                    self._connector.settimeout(self.timeout)  #blocking when self.timeout is None
                    self._connector.connect(sa)
                except socket.error as msg:
                    if self.verbose: print 'Socket connected {h}:{p} failed, desc:{m}'.format( h=self.host, p=self.port, m=msg )
                    self._connector.close()
                    self._connector = None
                    self._connected = False
                    self.desc = str(msg)
                    continue
                self._connected = True
                self.desc += ', connected'
                break
        elif self._connected:
            if self.verbose: print 'reconnecting'
            self.desc += 'reconnecting'
            self.close()
            self.connect()
        return self._connected

    def close(self):
        if self._connector is not None:
            self._connector.close()
            self._connector = None
        self.connected = False
        self.desc += ', closed'

    #try send data
    def send(self, strdata):
        if isinstance(self._connector, socket.SocketType) and self._connected:
            return self._connector.send(strdata)   #Returns the number of bytes  sent
        if self.verbose: print 'send failed.'
        return -1

    #try recv data
    def recv(self, bufsize=1024*16):
        if isinstance(self._connector, socket.SocketType) and self._connected:
            return self._connector.recv(bufsize)  #The return value is a string representing the data received. 
        else:
            if self.verbose: print 'recv failed.'
            return None

    #Guarantee send data
    def sendall(self, strdata):
        if isinstance(self._connector, socket.SocketType) and self._connected:
            res = self._connector.sendall(strdata) #None is returned on success, On error, an exception is raised
            if res is None: 
                return True
            else:
                if self.verbose: print 'sendall failed.'
                return False
        if self.verbose: print 'sendall parameter wrong.'
        return False

    #Guarantee recv data
    def recvall(self, recvlen):
        restlen = recvlen
        #if self.verbose: print "want recv data len:", recvlen
        if isinstance(self._connector, socket.SocketType) and self._connected and recvlen > 0:
            strdata = ''
            while len(strdata) < recvlen:
                chunk = self.recv(restlen)
                if chunk == '': break #raise RuntimeError('socket connection broken')
                strdata = strdata + chunk
                restlen -= len(chunk)
            if restlen == 0:
                #if self.verbose: print 'rest recv len={wln}, recv data(len={ln}):{dt}, '.format(wln=restlen, ln=len(strdata), dt=(strdata, ),)
                return strdata
            else:
                self.desc = "Socket connection broken."
                if self.verbose: print self.desc
                return None
        else:
            if self.verbose: print 'recv all parameter wrong.'
            return None
