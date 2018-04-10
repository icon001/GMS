unit uSubForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CommandArray, StdCtrls, RunDLL, Grids,DB,ExtCtrls,Jpeg,AdvGrid,AdvPageControl,AdvToolBar,
  Vcl.Imaging.pngimage;

type
//  TfmASubForm = class(TAdvToolBarForm)
  TfmASubForm = class(TForm)
    CommandArray: TCommandArray;
    ExcelEnImage: TImage;
    ExcelDisImage: TImage;
    Img_Stop: TImage;
    img_Start: TImage;
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    IsInsertGrade : Boolean;
    IsUpdateGrade : Boolean;
    IsDeleteGrade : Boolean;
    ModuleID : String;
    ErrorCode : Integer;

    Function  MainModule:TfmASubForm;
    Function  MainCommand(CommandName:String):TCommand;

    Function  FindSubForm(ModuleID:String):TfmASubForm;
    Function  FindClassForm(FormName:string):TfmASubForm;
    Function  FindCommand(CommandName:String):TCommand;

    Function  GetCommand(ModuleID,CommandName:String):TCommand;

    Procedure RunModule(ModuleID,DllName:String; Parent:TwinControl; Visible:Boolean);
    Procedure CloseModules(MainForm:TForm);
    Procedure RowGridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False); //모두 지움 쓰레기 데이터 남을수 없도록
    Procedure GridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False;aFixedRow:integer=1);
    procedure JPEGLoadFromDB(Field: TField; Image: TImage);
    procedure SaveToImageFileFromDB(Field: TField; aFileName:string);
    Function GetJPEGFromDB(Field:TField):TJPEGImage;

    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);virtual; abstract;
    procedure ShowDockPageControl(APageControl: TAdvPageControl; MakeVisible: Boolean; Client: TControl);virtual; abstract;
    procedure ParentCommand(aChildName,aCommand,aValue:string);virtual; abstract;
    procedure Form_Close;

  end;

var
  fmASubForm: TfmASubForm;

implementation

var
  FNilCommand : TCommand;

{$R *.dfm}

{ TfmASubForm }

procedure TfmASubForm.RunModule(ModuleID,DllName:String; Parent:TwinControl; Visible:Boolean);
begin
  TRunDLL.Run(ModuleID, DllName, Parent, Visible);
end;

procedure TfmASubForm.SaveToImageFileFromDB(Field: TField; aFileName: string);
var
  BlobField : TBlobField;
begin
  if FileExists(aFileName) then DeleteFile(aFileName);

  try
     BlobField:=(Field as TBlobField);
     if Not BlobField.IsNull then
     begin
        try
          BlobField.SaveToFile(aFileName);
        except
        end;
     end;
  Except
  end;
end;

function TfmASubForm.FindCommand(CommandName: String): TCommand;
begin
  Try
    Result:= CommandArray.FindCommand(CommandName);

    If Result = Nil then Begin
      ErrorCode:= -3;
      // Command를 못찾더라도 Execute를 실행하는데 에러를 내지 않는다.  에러코드만 변경
      Result:= FNilCommand;
    End Else ErrorCode:= 0;
  Except
//    ErrorCode:= -3;
    Result:= nil;
  end;
end;

function TfmASubForm.FindSubForm(ModuleID: String): TfmASubForm;
var
  Loop : Integer;
  stTemp : string;
begin
  ErrorCode:= -2;
  Result:= Nil;

  For Loop:= 0 to Application.ComponentCount-1 do Begin
    If Application.Components[Loop] is TForm then Begin
      stTemp := TfmASubForm(Application.Components[Loop]).Caption;
      If LowerCase(TfmASubForm(Application.Components[Loop]).ModuleID) = LowerCase(ModuleID) then
        Try
          ErrorCode:= 0;
          Result:= TfmASubForm(Application.Components[Loop]);
          Break;
        Except
        End;
    End;
  End;
end;

procedure TfmASubForm.Form_Close;
begin
  Close;
end;

function TfmASubForm.GetCommand(ModuleID, CommandName: String): TCommand;
var
  fmSub : TfmASubForm;
begin
  fmSub:= FindSubForm(ModuleID);
  If fmSub = Nil then Begin
    Result:= FNilCommand;
    Exit;
  End;

  Result:= fmSub.FindCommand(CommandName);
end;

function TfmASubForm.MainModule: TfmASubForm;
begin
  ErrorCode:= 0;

  Result:= TfmASubForm(Application.MainForm)
end;

function TfmASubForm.MainCommand(CommandName: String): TCommand;
begin
  If MainModule = Nil then Result:= FNilCommand
  Else Result:= MainModule.FindCommand(CommandName);
end;

procedure TfmASubForm.CloseModules(MainForm: TForm);
var
  Loop : Integer;
begin
  For Loop:= 0 to Application.ComponentCount-1 do Begin
    If not (Application.Components[Loop] is TForm) then Continue;
    If Application.Components[Loop] = MainForm then Continue;

    TForm(Application.Components[Loop]).Close;
  End;
end;

function TfmASubForm.FindClassForm(FormName: string): TfmASubForm;
var
  tmpFormClass : TFormClass;
  i : Integer;
  stTemp : string;
  clsName : String;
  tmpClass : TPersistentClass;
begin
  ErrorCode:= -2;
  Result:= Nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);

  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        Try
          ErrorCode:= 0;
          Result:= TfmASubForm(Screen.Forms[i]);
          Break;
        Except
        End;
      end;
    end;
  end;

end;

procedure TfmASubForm.GridInitialize(sg_Grid: TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    rowCount := aRow;
    for i:=0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;

end;

procedure TfmASubForm.JPEGLoadFromDB(Field: TField; Image: TImage);
var
  jpg: TJPEGImage;
  mem: TMemoryStream;
  BlobField : TBlobField;
begin
    jpg := TJPEGImage.Create;
    mem := TMemoryStream.Create;
    try
       BlobField:=(Field as TBlobField);
       if BlobField.IsNull then
       begin
            Image.Picture := nil;
       end else
       begin
            try
               BlobField.SaveToStream(mem);
               mem.Position := 0;
               jpg.LoadFromStream(mem);
               Image.Picture.Graphic := jpg;
            except
               Image.Picture := nil;
            end;
       end;
    finally
       mem.Free;
       jpg.Free;
    end;

end;

function TfmASubForm.GetJPEGFromDB(Field: TField): TJPEGImage;
var
  jpg: TJPEGImage;
  mem: TMemoryStream;
  BlobField : TBlobField;
begin
    jpg := TJPEGImage.Create;
    mem := TMemoryStream.Create;
    try
       BlobField:=(Field as TBlobField);
       if BlobField.IsNull then
       begin
            GetJPEGFromDB := nil;
       end else
       begin
            try
               BlobField.SaveToStream(mem);
               mem.Position := 0;
               jpg.LoadFromStream(mem);
               GetJPEGFromDB := jpg;
            except
               GetJPEGFromDB := nil;
            end;
       end;
    finally
       mem.Free;
       jpg.Free;
    end;

end;

procedure TfmASubForm.GridInit(sg: TAdvStringGrid; aCol: integer;aRow:integer = 2;bCheckBox:Boolean=False;aFixedRow:integer=1);
var
  i:integer;
begin
  with sg do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    RowCount := aRow;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,aFixedRow] := '';
    end;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
end;

procedure TfmASubForm.RowGridInitialize(sg_Grid: TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i,j:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    rowCount := aRow;
  end;
end;

initialization
  FNilCommand:= TCommand.Create(Nil);
finalization
  FreeAndNil(FNilCommand);
end.

