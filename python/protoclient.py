#!/usr/bin/env python
# coding=utf-8

from struct         import pack, unpack
from socketclient   import SocketClient
from atproto.cs_basic_pb2 import CSMessageHeader

class ProtoClient(object):
    def __init__(self, host="127.0.0.1", port=20000, headfmt='>II', headlen=8, timeout=None, verbose=False):
        self.verbose     = verbose

        self.headfmt = headfmt
        self.headlen = headlen

        self.recvtotallen=0
        self.recvheadlen =0
        self.recvbodylen = 0
        self.recvhead    = None
        self.recvbody    = None

        self.sendbodylen = 0
        self.sendhead    = None
        self.sendbody    = None

        self._sock = SocketClient(host=host, port=port, headlen=headlen, timeout=timeout, verbose=verbose)
        self._sock.connect()

    def send_message(self, total_len, header_len, msghead, msgbody):
        if isinstance(self._sock, SocketClient):
            if self.verbose: print "Msg Total  Len:", total_len
            if self.verbose: print "Msg Header Len:", header_len
            self.sendhead = pack(self.headfmt, total_len, header_len)
            data          = self.sendhead + msghead + msgbody

            if self.verbose: print "send data:"
            if self.verbose: print "\t%r" % data

            return self._sock.sendall( data )
        else:
            return False

    #接收包头和包体，成功返回True，失败返回 False
    def recv_message(self):
        if self.recv_head() and self.recv_msghead():
            if self.recvbodylen > 0:
                self.recv_msgbody()
            return True
        else:
            return False

    def get_recvtotallen(self):
        return self.recvtotallen

    def get_recvheadlen(self):
        return self.recvheadlen

    def get_recvbodylen(self):
        return self.recvbodylen

    def get_recvmsghead(self):
        return self.recvhead

    def get_recvbody(self):
        return self.recvbody

    #接收包头，并unpack成协议元组, 返回unpack后的对象
    def recv_head(self):
        if isinstance(self._sock, SocketClient) and self.headlen > 0:
            data = self._sock.recvall(self.headlen)
            if self.verbose: print 'Recv head data:', (data,)
            if data is not None:
                self.recvtotallen, self.recvheadlen = unpack(self.headfmt, data)
                if self.verbose: print '\tRecv total len {tl}\n\tHead len {hl}.'.format(tl=self.recvtotallen, hl=self.recvheadlen)
                if isinstance(self.recvtotallen, (int,long)) and isinstance(self.recvheadlen, (int,long)):
                    self.recvbodylen= self.recvtotallen - self.recvheadlen - 4
                    self.recvbody   = ''
                else:
                    print '\tRecieve proto header format error.'
                    self.recvbodylen= 0
                    self.recvbody   = None
                if self.verbose: print '\tRecv body len {bl}.'.format(bl=self.recvbodylen)
            else:
                print '\tRecieve proto header error, should no be none.'
                self.recvbodylen= 0
                self.recvbody   = None
                return None
        else:
            print '\tSocket error, or proto header define error.'
            self.recvbody = None
            self.recvbodylen= 0
            return None
        return self.recvtotallen, self.recvheadlen

    #接收包头，并unpack成协议元组, 返回unpack后的对象
    def recv_msghead(self, msghd_info = CSMessageHeader()):
        if isinstance(self._sock, SocketClient) and self.recvheadlen > 0:
            data = self._sock.recvall( self.recvheadlen -4 )
            if self.verbose: print 'Recv message head info:', (data,)
            if data is not None:
                msghd_info.ParseFromString(data)
                self.recvhead = msghd_info
                if self.verbose: print 'recv message head info:', msghd_info
            else:
                print '\tRecieve message header error, should not be none.'
                self.recvbodylen= 0
                self.recvbody   = None
        else:
            print '\tSocket error, or message header error.'
            self.recvhead = None
            self.recvbody = None
            self.recvbodylen= 0
        return self.recvhead

    #根据包头长度信息接收包体，返回接收的原始数据
    def recv_msgbody(self):
        if isinstance(self._sock, SocketClient) and self.recvhead and self.recvbodylen > 0:
            self.recvbody = self._sock.recvall(self.recvbodylen)
            if self.verbose: print 'recv body data:', (self.recvbody,)
        else:
            self.recvbody   = None
            self.recvbodylen= 0
        return self.recvbody

