object dmGMSDataBase: TdmGMSDataBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object ADOConnection: TADOConnection
    ConnectionString = 
      'DRIVER={XTG Systems InterBase6 ODBC driver};DB=127.0.0.1:BMOS;UI' +
      'D=SYSDBA;'
    Left = 56
    Top = 8
  end
end
