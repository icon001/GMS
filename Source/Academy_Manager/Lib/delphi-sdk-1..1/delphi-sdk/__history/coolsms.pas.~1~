unit coolsms;

{ coolsms }
interface
  uses
    System.Json, https, System.SysUtils, Classes;

  type
    resource = class
    private
     class var sms_url: String;
     class var senderid_url: String;
  	 class var https: handler;
    published
     { set api_key and api_secret }
     Constructor Create(key: String; secret: String);
    public
     { sms resource }
     class function send(data: TStringList): TJSONObject;
     class function sent(data: TStringList): TJSONObject;
     class function cancel(data: TStringList): TJSONObject;
     class function balance(): TJSONObject;

     { senderid resource }
     class function register(data: TStringList): TJSONObject;
     class function verify(data: TStringList): TJSONObject;
     class function delete(data: TStringList): TJSONObject;
     class function list(): TJSONObject;
     class function setDefault(data: TStringList): TJSONObject;
     class function getDefault(): TJSONObject;
  end;

implementation
  { get Development Lang & version }
  function getDevelopmentLang(): String;
  var
    info: String;
  begin
    info := 'under XE4';
    if CompilerVersion.ToString() = '29' then info := 'XE8';
    if CompilerVersion.ToString() = '28' then info := 'XE7';
    if CompilerVersion.ToString() = '27' then info := 'XE6';
    if CompilerVersion.ToString() = '26' then info := 'XE5';
    if CompilerVersion.ToString() = '25' then info := 'XE4';
    info := 'Delphi ' + info;
    Result := info;
  end;

  { get OS Version }
  function getOsVersion(): String;
  var
    info: String;
  begin
    info := IntToStr(Win32MajorVersion) + '.' + IntToStr(Win32MinorVersion);
    if info = '5.0' then info := '2000';
    if info = '5.1' then info := 'XP';
    if info = '5.2' then info := '2003 server or XP64';
    if info = '6.0' then info := 'Vista/2008 server';
    if info = '6.1' then info := '7/2008 server R2';
    if info = '6.2' then info := '8';
    info := 'Windows ' + info;
    Result := info;
  end;

  { send message }
  class function resource.send(data: TStringList): TJSONObject;
  begin
    // get OS Version
    if data.Values['os_platform'].IsEmpty = TRUE then data.Values['os_platform'] := getOsVersion();

    // get Development Lang & version and sdk_version
    data.Values['dev_lang'] := getDevelopmentLang();
    data.Values['sdk_version'] := 'Delphi SDK 1.0';

    Result := resource.https.postRequest(resource.sms_url + 'send?', data);
  end;

  { sent message }
  class function resource.sent(data: TStringList): TJSONObject;
  begin
    Result := resource.https.request(resource.sms_url + 'sent?', data);
  end;

  { cancel reserve message }
  class function resource.cancel(data: TStringList): TJSONObject;
  begin
    Result := resource.https.postRequest(resource.sms_url + 'cancel?', data);
  end;

  { user balance info }
  class function resource.balance(): TJSONObject;
  begin
    Result := resource.https.request(resource.sms_url + 'balance?', Nil);
  end;

  { register sender number }
  class function resource.register(data: TStringList): TJSONObject;
  begin
    Result := resource.https.postRequest(resource.senderid_url + 'register?', data);
  end;

  { verify sender number }
  class function resource.verify(data: TStringList): TJSONObject;
  begin
    Result := resource.https.postRequest(resource.senderid_url + 'verify?', data);
  end;

  { delete sender number }
  class function resource.delete(data: TStringList): TJSONObject;
  begin
    Result := resource.https.postRequest(resource.senderid_url + 'delete?', data);
  end;

  { get sender number list }
  class function resource.list(): TJSONObject;
  begin
     Result := resource.https.request(resource.senderid_url + 'list?', Nil);
  end;

  { set default sender number }
  class function resource.setDefault(data: TStringList): TJSONObject;
  begin
    Result := resource.https.postRequest(resource.senderid_url + 'set_default?', data);
  end;

  { get default sender number }
  class function resource.getDefault(): TJSONObject;
  begin
     Result := resource.https.request(resource.senderid_url + 'get_default?', Nil);
  end;

  { set api_key and api_secret }
  constructor resource.Create(key: String; secret: String);
  begin
    https := handler.Create(key, secret);
    sms_url := 'https://api.coolsms.co.kr/sms/1.5/';
	senderid_url := 'https://api.coolsms.co.kr/senderid/1.1/';
  end;
end.
