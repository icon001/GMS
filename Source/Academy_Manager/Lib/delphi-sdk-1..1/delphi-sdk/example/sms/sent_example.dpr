program sent_example;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Json, coolsms in '..\..\coolsms.pas', https in '..\..\https.pas', System.SysUtils, Classes;

var
  coolsms: resource;
  data: TStringList;
  jsonObject: TJSONObject;
  jsonArray: TJSONArray;
  jsonObjectData: TJSONObject;
  i: integer;

begin
  try
    // api_key, api_secret ����
    coolsms := resource.Create('NCS55882FB7DE511A', '4FB5FF82B9AB7D0E0AEB840D403DE0F74');
    //https.create('NCS55882FB7DE511A', '4FB5FF82B9AB7D0E0AEB840D403DE0F74');

    // parameters, data ���� mid�� gid �� �� �ϳ��� ���� �մϴ�.
    data := TStringList.create;
    data.Values['mid'] := 'R1M55B1FFB27E5308'; // �޽���ID

    // �׿� parameters, http://www.https.co.kr/SMS_API#GETsent ����
    {
    	data.Values['count']
      	�⺻�� 20�̸� 20���� ����� ���� �� ����. 40�Է½� 40���� ����� ����
      data.Values['page']
      	1���� �����ϴ� ��������
      data.Values['rcpt']
      	���Ź�ȣ�� �˻�
      data.Values['start']
      	�˻� �����Ͻ� ���� ��¥�� �ð����� �˻� YYYY-MM-DD HH:MI:SS ������ ��¥�� �ð�
      data.Values['end']
      	�˻� �����Ͻ� ���� ��¥�� �ð����� �˻� YYYY-MM-DD HH:MI:SS ������ ��¥�� �ð�
      data.Values['status']
      	�޽��� ���� ������ �˻�
      data.Values['resultcode']
      	���۰�� ������ �˻�
      data.Values['notin_resultcode']
      	�Էµ� ���۰�� �� �̿��� �ǵ鸸 ��ȸ
      data.Values['gid']
      	�׷�ID
    }

    // sent Messages
    jsonObject := coolsms.sent(data);
    if strToBool(jsonObject.GetValue('status').ToString) = TRUE then
    begin
      Writeln('����');
      jsonArray := JsonObject.Get('data').JsonValue as TJSONArray;

      Writeln('total_count : ' + jsonObject.Get('total_count').JsonValue.ToString);
      Writeln('list_count : ' + jsonObject.Get('list_count').JsonValue.ToString);
      Writeln('page : ' + jsonObject.Get('page').JsonValue.ToString);

      for i := 0 to jsonArray.Size - 1 do
      begin
          jsonObjectData := TJSONObject.Create;
          jsonObjectData := jsonArray.Get(i) as TJSONObject;

          Writeln('-----------------------------------------');
          Writeln('type : ' + jsonObjectData.Get('type').JsonValue.ToString);
          Writeln('recipient_number : ' + jsonObjectData.Get('recipient_number').JsonValue.ToString);
          Writeln('text : ' + jsonObjectData.Get('text').JsonValue.ToString);
          Writeln('carrier : ' + jsonObjectData.Get('carrier').JsonValue.ToString);
          Writeln('status : ' + jsonObjectData.Get('status').JsonValue.ToString);
          Writeln('result_code : ' + jsonObjectData.Get('result_code').JsonValue.ToString);
          Writeln('result_message : ' + jsonObjectData.Get('result_message').JsonValue.ToString);
          Writeln('message_id : ' + jsonObjectData.Get('message_id').JsonValue.ToString);
          Writeln('group_id : ' + jsonObjectData.Get('group_id').JsonValue.ToString);
          Writeln('sent_time : ' + jsonObjectData.Get('sent_time').JsonValue.ToString);
          Writeln('accepted_time : ' + jsonObjectData.Get('accepted_time').JsonValue.ToString);
      end;
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
