program register_example;
{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Json, coolsms in '..\..\coolsms.pas', https in '..\..\https.pas', System.SysUtils, Classes;

var
  coolsms: resource;
  data: TStringList;
  jsonObject: TJSONObject;

begin
  try
    // http://www.coolsms.co.kr/SenderID_API#POSTregister ����

    // api_key, api_secret ����
    coolsms := resource.Create('NCS55882FB7DE511A', '4FB5FF82B9AB7D0E0AEB840D403DE0F74');

    // parameters
    data := TStringList.create;
    data.Values['phone'] := '01090683469'; // �߽Ź�ȣ�� ����� ��ȭ��ȣ�� �Է����ּ���.

    // �߽Ź�ȣ��� ��û
    jsonObject := coolsms.register(data);
    if strToBool(jsonObject.GetValue('status').ToString) = TRUE then
    begin
      Writeln('����');
      Writeln('handle_key : ' + jsonObject.Get('handle_key').JsonValue.ToString);
      Writeln('ars_number : ' + jsonObject.Get('ars_number').JsonValue.ToString);
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
