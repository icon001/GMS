object dmRelayDataBase: TdmRelayDataBase
  OldCreateOrder = False
  Height = 171
  Width = 270
  object ADOConnection: TADOConnection
    ConnectionString = 
      'DRIVER={XTG Systems InterBase6 ODBC driver};DB=127.0.0.1:BMOS;UI' +
      'D=SYSDBA;'
    Left = 56
    Top = 8
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 56
    Top = 64
  end
  object ADOEventQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 160
    Top = 64
  end
  object ADOTempQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 112
  end
end
