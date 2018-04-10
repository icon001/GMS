﻿unit uFireGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlassButton, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, AdvSmoothPanel, AdvOfficeTabSet, Vcl.StdCtrls, AdvEdit,ADODB,ActiveX,
  uSubForm, CommandArray, AdvSmoothLabel, Vcl.Menus, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers, AdvAppStyler, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, AdvGlowButton;

type
  TfmFireGroup = class(TfmASubForm)
    List: TAdvSmoothPanel;
    sg_List: TAdvStringGrid;
    ed_FireGroupName: TAdvEdit;
    ed_Code: TAdvEdit;
    AdvSmoothLabel1: TAdvSmoothLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_Add: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    AdvSmoothLabel2: TAdvSmoothLabel;
    procedure FormShow(Sender: TObject);
    procedure sg_ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_ListClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SearchFireGroup(aCode:string);
  public
    { Public declarations }
  end;

var
  fmFireGroup: TfmFireGroup;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDBInsert,
  uDBDelete,
  uDBSelect,
  uDBUpdate,
  uDataBase,
  uDBFunction;

{$R *.dfm}

procedure TfmFireGroup.btn_AddClick(Sender: TObject);
var
  stFireGroupCode : string;
begin
  inherited;
  stFireGroupCode := ed_Code.Text;
  if Not isDigit(ed_Code.Text) then
  begin
    stFireGroupCode := dmDBFunction.GetNextTB_FIREGROUP_ID;
    dmDBInsert.InsertIntoTB_FIREGROUP_All(stFireGroupcode,ed_FireGroupName.text);
  end else
  begin
    dmDBUpdate.UpdateTB_FIREGROUP_Field_StringValue(stFireGroupCode,'FG_GROUPCODENAME',ed_FireGroupName.text);
  end;
  SearchFireGroup(stFireGroupCode);
end;

procedure TfmFireGroup.btn_DeleteClick(Sender: TObject);
begin
  if Not isDigit(ed_Code.Text) then
  begin
    SearchFireGroup('');
    Exit;
  end;
  dmDBDelete.DeleteTB_FIREGROUP_Value(ed_Code.Text);
  SearchFireGroup('');

end;

procedure TfmFireGroup.FormShow(Sender: TObject);
begin
  SearchFireGroup('');
end;

procedure TfmFireGroup.N1Click(Sender: TObject);
begin
  inherited;
    if sg_List.Cells[1,sg_List.RowCount - 1] <> '' then
    begin
      sg_List.AddRow;
      sg_List.SelectRows(sg_List.RowCount - 1,1);
      sg_ListClick(sg_List);
    end;

end;

procedure TfmFireGroup.SearchFireGroup(aCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,1,2);

  stSql := dmDBSelect.SelectTB_FIREGROUP_Name('');

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      sg_List.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_List do
        begin
          Cells[0,nRow] := FindField('FG_GROUPCODENAME').AsString;
          Cells[1,nRow] := FindField('FG_GROUPCODE').AsString;

          if FindField('FG_GROUPCODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ListClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFireGroup.sg_ListClick(Sender: TObject);
begin
  inherited;
  with sg_List do
  begin
    ed_FireGroupName.Text := cells[0,Row];
    ed_Code.Text := cells[1,Row];
  end;
//
end;

procedure TfmFireGroup.sg_ListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 40) or (Key = 13) then
  begin
    if sg_List.Row = sg_List.RowCount - 1 then
    begin
      if sg_List.Cells[1,sg_List.Row] <> '' then
      begin
        sg_List.AddRow;
        sg_List.SelectRows(sg_List.RowCount - 1,1);
        sg_ListClick(sg_List);
      end;
    end;
  end;

end;

end.