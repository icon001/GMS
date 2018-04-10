unit https;

{ coolsms class interface�� ����� �Ʒ� implementation���� ���� }
interface
  uses
    IdURI, System.Json, IdHash, IdHMACMD5, IDGlobal, DateUtils, IdException, IdHTTP, IdSSLOpenSSL, IdMultipartFormData, Classes, System.SysUtils;

  type
    handler = class
    private
     class var api_key: String;
     class var api_secret: String;
    published
     { set api_key and api_secret }
     Constructor Create(key: String; secret: String);
    public
     { request(post) }
     class function postRequest(url: String; data: TStringList): TJSONObject;
     { request(get) }
     class function request(url: String; data: TStringList): TJSONObject;
   end;

implementation
  { api request�� ���� Adata  ���� md5�� encrypt }
  function hashHmacMd5(const AData, AKey: string): string;
  var
     HMACMD5: TIdHMACMD5;
     KeyBytes, DataBytes, ResBytes: TIdBytes;
     i: integer;
  begin
     HMACMD5 := TIdHMACMD5.Create;

     try
       HMACMD5.Key := ToBytes(AKey);
       ResBytes := HMACMD5.HashValue(ToBytes(AData));

       Result := '';
       for i := low(ResBytes) to high(ResBytes) do
         Result := Result + inttohex(ResBytes[i], 2);

     finally
       HMACMD5.Free;
     end;
  end;

  { get random string }
  function randomString(): string;
  var
    str: string;
  begin
    Randomize;
    //string with all possible chars
    str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    Result := '';
    repeat
      Result := Result + str[Random(Length(str)) + 1];
    until (Length(Result) = 10)
  end;

  { image�� ������ string data ���� data�� delimiter�� �и��ؼ� �ִ´� }
  function split(delimiter: Char; input: string; data: TIdMultiPartFormDataStream): TIdMultiPartFormDataStream ;
  var
    string_list: TStringList;
  begin
    string_list := TSTringList.Create;
    string_list.Delimiter := delimiter;
    string_list.DelimitedText := input;

    // �ش� string data�� image�� �ƴϸ� data�� add
    if string_list[0] <> 'image' then
    begin
      data.AddFormField(string_list[0], string_list[1]);
    end;

    string_list.Clear;
    Result := data;
  end;

  { set basic request data }
  function setBasicReuqestData(data: TStringList): TStringList;
  var
    signature, salt, timestamp: String;
  begin
    salt := randomString();
    timestamp := IntToStr(DateTimetoUnix(IncHour(Now, -9)));
    signature := hashHmacMd5(timestamp + salt, handler.api_secret);

    data.Values['api_key'] := handler.api_key;
    data.Values['salt'] := salt;
    data.Values['signature'] := signature;
    data.Values['timestamp'] := timestamp;
    Result := data;
  end;

  { request(POST) }
  class function handler.postRequest(url: String; data: TStringList): TJSONObject;
  var
    params: TStringList;
    http: TIdHTTP;
    idSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    jsonObject: TJSONObject;
    response, data_string: String;
    multi_data: TIdMultiPartFormDataStream;
  begin
    params := TStringList.Create;
    http := TIdHTTP.Create();
    jsonObject := TJSonObject.Create;
    idSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;

    try
      // �⺻����
      data := setBasicReuqestData(data);

      http.IOHandler := idSSLIOHandlerSocketOpenSSL;
      http.Request.ContentType := 'application/x-www-form-urlencoded';
      http.Request.UserAgent := 'Coolsms REST API/ DelPhi SDK 1.0';

      // image�� ������ TStringList�� �ƴ� TIdMultiPartFormDataStream���� data�� �����Ѵ�.
      if data.Values['image'].IsEmpty = FALSE then
      begin
        multi_data := TIdMultiPartFormDataStream.Create;
        for data_string in data do
          multi_data := split('=', data_string, multi_data);

        multi_data.AddFile('image', data.Values['image']);
        response := http.Post(url, multi_data);
      end
      else
      begin
        response := http.Post(url, data);
      end;

      if response.Equals('') = FALSE then
      begin
        // response�� �ִٸ�
        jsonObject := TJSONObject.ParseJSONValue(response) as TJSONObject;
      end;
      jsonObject.AddPair(TJSONPair.Create('status', TJSONTrue.Create));
      Result := jsonObject;
    except
      // http exception ó��
      on E: EIdHTTPProtocolException  do
        begin
          jsonObject := TJSONObject.ParseJSONValue(E.ErrorMessage) as TJSONObject;
          jsonObject.AddPair(TJSONPair.Create('status', TJSONFalse.Create));
          Result := jsonObject;
        end;
      // �׿� exception ó��
      on E: Exception do
        begin
          jsonObject.AddPair(TJSONPair.Create('message', E.Message));
          jsonObject.AddPair(TJSONPair.Create('status', TJSONFalse.Create));
          Result := jsonObject;
        end;
    end;

    http.Free;
  end;

  { request(GET) }
  class function handler.request(url: String; data: TStringList): TJSONObject;
  var
    http: TIdHTTP;
    jsonObject: TJSONObject;
    data_string, response: String;
    jsonArray: TJSONArray;
  begin
    http := TIdHTTP.Create();
    jsonObject := TJSONObject.Create;

    try
      if data = nil then data := TStringList.Create;

      // �⺻����
      data := setBasicReuqestData(data);

      for data_string in data Do
        url := url + data_string + '&';

      delete(url, length(url), 1);
      url := TIdURI.URLEncode(url);
      response := http.get(url);

      try
        jsonObject := TJSONObject.ParseJSONValue(response) as TJSONObject;
        jsonObject.AddPair(TJSONPair.Create('status', TJSONTrue.Create));
      except
        begin
          try
            jsonArray := TJSONObject.ParseJSONValue(response) as TJSONArray;
            jsonObject.AddPair('data', jsonArray);
            jsonObject.AddPair(TJSONPair.Create('status', TJSONTrue.Create));
          except
            on E: Exception do
            begin
              jsonObject.AddPair(TJSONPair.Create('status', TJSONFalse.Create));
              jsonObject.AddPair('message', E.Message);
            end;
          end;
        end;
      end;
      Result := jsonObject;
    except
      on E: EIdHTTPProtocolException  do
        begin
          jsonObject := TJSONObject.ParseJSONValue(E.ErrorMessage) as TJSONObject;
          jsonObject.AddPair(TJSONPair.Create('status', TJSONFalse.Create));
          Result := jsonObject;
        end;
      on E: Exception do
        begin
          jsonObject.AddPair(TJSONPair.Create('message', E.Message));
          jsonObject.AddPair(TJSONPair.Create('status', TJSONFalse.Create));
          Result := jsonObject;
        end;
    end;

    http.Free;
  end;

  { set api_key and api_secret }
  constructor handler.Create(key: String; secret: String);
  begin
    api_key := key;
    api_secret := secret;
  end;
end.
