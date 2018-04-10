object dmSKACSDataBase: TdmSKACSDataBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 220
  Width = 215
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Data Source=localhost;Initial Catalog=SKACS;Integrated Security=' +
      'SSPI'
    Left = 56
    Top = 8
  end
  object ADOTempQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 120
    Top = 8
  end
  object MDBADOConnection: TADOConnection
    ConnectionString = 
      'Data Source=localhost;Initial Catalog=SKACS;Integrated Security=' +
      'SSPI'
    Left = 48
    Top = 80
  end
  object MDBADOQuery: TADOQuery
    Connection = MDBADOConnection
    Parameters = <>
    Left = 112
    Top = 80
  end
  object BiostarADOConnection: TADOConnection
    ConnectionString = 
      'Data Source=localhost;Initial Catalog=SKACS;Integrated Security=' +
      'SSPI'
    Left = 48
    Top = 152
  end
  object BiostarADOQuery: TADOQuery
    Connection = BiostarADOConnection
    Parameters = <>
    Left = 112
    Top = 152
  end
end
