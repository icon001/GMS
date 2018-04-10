object dmClientSocket: TdmClientSocket
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object TcpClient1: TTcpClient
    BlockMode = bmNonBlocking
    OnConnect = TcpClient1Connect
    OnDisconnect = TcpClient1Disconnect
    OnReceive = TcpClient1Receive
    OnError = TcpClient1Error
    Left = 24
    Top = 8
  end
end
