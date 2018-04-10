object dmFingerDBRelay: TdmFingerDBRelay
  OldCreateOrder = False
  Height = 150
  Width = 305
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=lomo;Ini' +
      'tial Catalog=LOMO;Data Source=127.0.0.1'
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 32
  end
  object RelayExeQuery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 183
    Top = 32
  end
end
