program cancel_example;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Json, coolsms in '..\..\coolsms.pas', https in '..\..\https.pas', System.SysUtils, Classes;

var
  coolsms: resource;
  jsonObject: TJSONObject;
  data: TStringList;

begin
  try
    // api_key, api_secret ����
    coolsms := resource.Create('NCS55882FB7DE511A', '4FB5FF82B9AB7D0E0AEB840D403DE0F74');

    // parameters, http://www.coolsms.co.kr/SMS_API#POSTcancel ����
    data := TStringList.create;
    data.Values['mid'] := 'R1M55D585C2CE9E9'; // �޽���ID
    // data.Values['gid'] := ''; // �׷�ID

    // ������� ��û
    jsonObject := coolsms.cancel(data);
    if strToBool(jsonObject.GetValue('status').ToString) = TRUE then
    begin
      Writeln('����');
    end
    else
    begin
      Writeln('����');
      if jsonObject.Get('code').Equals(Nil) = FALSE then Writeln('code : ' + jsonObject.Get('code').JsonValue.ToString);
      if jsonObject.Get('message').Equals(Nil) = FALSE then Writeln('message : ' + jsonObject.Get('message').JsonValue.ToString);
    end;

    jsonObject.Free;

    Writeln('-----------------------------------------');
    Writeln('Press <enter> to quit...');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

