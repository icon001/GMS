object dmDataBase: TdmDataBase
  OldCreateOrder = False
  Height = 186
  Width = 271
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=postgres;' +
      'Data Source=PostgreSQL31;Initial Catalog=gms;'
    Provider = 'MSDASQL.1'
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
