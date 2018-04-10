
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uMapArmAreaState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.ImgList, AdvSmoothPanel, AdvSmoothButton, CommandArray,System.IniFiles,
  ieview, imageenview, ievect,Data.Win.ADODB,ActiveX, AdvSmoothLabel,
  AdvPageControl, Vcl.OleCtrls, NemoLib_TLB, AdvToolBar, AdvToolBarStylers,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler, Vcl.Imaging.pngimage;


type
  TMapAlarm = class(TComponent)
  private
    FName: string;
    FCode: string;
    Fhobj: integer;
  public
    property hobj : integer read Fhobj write Fhobj;
    property Code : string read FCode write FCode;
    property Name : string read FName write FName;
  end;

  TfmMapArmAreaState = class(TfmASubForm)
    PopupMenu1: TPopupMenu;
    pm_ArmModeChange: TMenuItem;
    pm_DisArmModeChange: TMenuItem;
    pm_3: TMenuItem;
    pm_LargeIcon: TMenuItem;
    pm_4: TMenuItem;
    pm_DeviceInfo: TMenuItem;
    pm_5: TMenuItem;
    pm_AlarmReport: TMenuItem;
    pm_AlarmConfirm: TMenuItem;
    pm_2: TMenuItem;
    pm_ArmAreaStateSearch: TMenuItem;
    W7Panel1: TW7Panel;
    ImageEnVect1: TImageEnVect;
    pan_DoorInfo: TAdvSmoothPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lb_DeviceID: TLabel;
    lb_ArmAreaNo: TLabel;
    lb_Building: TLabel;
    Label9: TLabel;
    lb_ArmAreaName: TLabel;
    Label5: TLabel;
    lb_TelNo: TLabel;
    Label7: TLabel;
    AdvSmoothButton1: TAdvSmoothButton;
    memo1: TMemo;
    ed_NodeIP: TEdit;
    mn_ImageFit: TMenuItem;
    mn_ImageOrg: TMenuItem;
    mn_Name: TMenuItem;
    pm_1: TMenuItem;
    AlarmTimer: TTimer;
    lb_name: TAdvSmoothLabel;
    pm_CCTV1: TMenuItem;
    pm_6: TMenuItem;
    PageCCTV: TAdvPageControl;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mn_ImageFitClick(Sender: TObject);
    procedure mn_ImageOrgClick(Sender: TObject);
    procedure ImageEnVect1ZoomIn(Sender: TObject; var NewZoom: Double);
    procedure ImageEnVect1SelectObject(Sender: TObject);
    procedure ImageEnVect1ObjectClick(Sender: TObject; hobj: Integer);
    procedure ImageEnVect1ObjectOver(Sender: TObject; hobj: Integer);
    procedure pm_AlarmConfirmClick(Sender: TObject);
    procedure pm_ArmAreaStateSearchClick(Sender: TObject);
    procedure pm_AlarmReportClick(Sender: TObject);
    procedure pm_DeviceInfoClick(Sender: TObject);
    procedure pm_ArmModeChangeClick(Sender: TObject);
    procedure pm_DisArmModeChangeClick(Sender: TObject);
    procedure AlarmTimerTimer(Sender: TObject);
    procedure ImageEnVect1DblClick(Sender: TObject);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageCCTVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageCCTVMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageCCTVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageCCTVDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure PageCCTVDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PageCCTVUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure pm_CCTV1Click(Sender: TObject);
  private
    SubCodeList : TStringList;
    AlarmEventCodeList : TStringList;
    L_bAlarmTrigger : Boolean;
    L_bFormActive : Boolean;
    L_bViewRefresh : Boolean;
    L_nViewListStyle : integer;
    L_bImageFit : Boolean;
    L_stSelectCode : string;
    L_nTempSeq : integer;
    procedure LoadMap;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    FBuildingCode: string;
    FFormTYPE: String;
    CCTVFormList : TStringList;
    DragOrigin: TPoint;
    FMouseDowning: BOOLEAN;
    FParentTop: integer;
    FParentLeft: integer;
    procedure CreateDockableWindows(aCCTVSeq,aCCTVIP,aCCTVPort,aCCTVName,aCCTVUserID,aCCTVUserPw:string);
    procedure ShowDockableWindows(aCCTVSeq:string);
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //��ŷ�Ǿ� �ִ� ���¿��� �ٸ� ���� ��ŷ�� �õ��ϴ� ��� �߻�
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Msg: TMessage); message WM_NCLBUTTONUP;
    procedure SetParentLeft(const Value: integer);
    procedure FontSetting;
  public
    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);override;
    procedure ShowDockPageControl(APageControl: TAdvPageControl; MakeVisible: Boolean; Client: TControl);override;
  public
    procedure ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceReload;
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure SecurityEventClear;
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property FormTYPE : String read FFormTYPE write FFormTYPE;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property MouseDowning : BOOLEAN read FMouseDowning write FMouseDowning;
    property ParentTop : integer read FParentTop write FParentTop;
    property ParentLeft : integer read FParentLeft write SetParentLeft;
  end;

implementation
uses
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uFormDeviceState,
  uFormVariable,
  uCommonVariable,
  uCommonFunction,
  uCCTV,
  uPCClient,
  uServerClientVariable,
  uBuildingAlarmConfirm,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmMapArmAreaState.FormDockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is Tform);
  //Draw dock preview depending on where the cursor is relative to our client area
  if Accept and (ComputeDockingRect(ARect, Point(X, Y)) <> alNone) then
  begin
    ComputeDockingRect(ARect, Point(X, Y));
    Source.DockRect := ARect;
  end;
end;

procedure TfmMapArmAreaState.FormResize(Sender: TObject);
begin
  inherited;
  pan_DoorInfo.Left := (W7Panel1.Width div 2) - (pan_DoorInfo.Width div 2);
  pan_DoorInfo.Top := (W7Panel1.Height div 2) - (pan_DoorInfo.Height div 2);

  ImageEnVect1.Left := 15;
  ImageEnVect1.Top := 15;
  ImageEnVect1.Width := W7Panel1.Width - 30;
  ImageEnVect1.Height := W7Panel1.Height - 30;

  if L_bImageFit then ImageEnVect1.Fit;

//
end;

procedure TfmMapArmAreaState.FormShow(Sender: TObject);
begin
  inherited;
  LoadMap;
  pm_AlarmConfirm.Visible := True;
  if FormTYPE = 'BUILDING' then
  begin
    pm_ArmAreaStateSearch.Visible := False;
    pm_ArmModeChange.Visible := False;
    pm_DisArmModeChange.Visible := False;
    pm_4.Visible := False;
    pm_DeviceInfo.Visible := False;
    pm_2.Visible := False;
  end else
  begin
    pm_ArmAreaStateSearch.Visible := True;
    pm_ArmModeChange.Visible := True;
    pm_DisArmModeChange.Visible := True;
    pm_4.Visible := True;
    pm_DeviceInfo.Visible := True;
    pm_4.Visible := True;
  end;
end;

procedure TfmMapArmAreaState.ImageEnVect1DblClick(Sender: TObject);
begin
  if Not fmParent.IsInsertGrade then
  begin
    pm_ArmModeChange.Enabled := False;
    pm_DisArmModeChange.Enabled := False;
  end else
  begin
    pm_ArmModeChange.Enabled := True;
    pm_DisArmModeChange.Enabled := True;
  end;
  Try
    if FormTYPE = 'BUILDING' then
    begin
      FfmParent.ParentCommand('TfmMapArmAreaState','BUILDINGCHANGE',L_stSelectCode);
      Exit;
    end;
  Except
    Exit;
  End;

end;

procedure TfmMapArmAreaState.ImageEnVect1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  lb_name.Top := y;
  lb_name.Left := X - (lb_name.Width div 2);

end;

procedure TfmMapArmAreaState.ImageEnVect1ObjectClick(Sender: TObject;
  hobj: Integer);
begin
  inherited;
  //�� ���μ����� ��ź��.
//  ImageEnVect1.MouseInteractVt:=[miUnStampMode];
  if FormTYPE <> 'BUILDING' then
  begin
    ImageEnVect1.UnSelAllObjects;
    ImageEnVect1.AddSelObject(hobj);
    ImageEnVect1.ObjTransparency[hobj] := 250;
  end;

end;

procedure TfmMapArmAreaState.ImageEnVect1ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
//  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  ImageEnVect1.UnSelAllObjects;
  ImageEnVect1.AddSelObject(hobj);
  if FormTYPE = 'BUILDING' then
  begin
    //ImageEnVect1.ObjTransparency[hobj] := 150;
  end else
  begin
    //ImageEnVect1.ObjTransparency[hobj] := 250;
  end;
end;

procedure TfmMapArmAreaState.ImageEnVect1SelectObject(Sender: TObject);
var
  i,hobj:integer;
  mydata:PMyData;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject( hobj ) then
      begin
        lb_name.Visible := True;
        if FormTYPE = 'BUILDING' then
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            mn_Name.Caption := '���õ���ġ:' + mydata.BuildingName;
            lb_name.Caption.Text := mydata.BuildingName;
            L_stSelectCode := mydata.BuildingID;
            if AlarmEventCodeList.IndexOf(mydata.BuildingID) > -1 then continue;
          end;
          ImageEnVect1.ObjTransparency[hobj] := 150;
        end else
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            mn_Name.Caption := '���õ���ġ:' + mydata.ArmAreaName;
            lb_name.Caption.Text := mydata.ArmAreaName;
            L_stSelectCode := myData.ArmAreaID;
            if copy(L_stSelectCode,1,1) = 'C' then
            begin
              pm_1.Visible := False;
              pm_AlarmConfirm.Visible := False;
              pm_ArmAreaStateSearch.Visible := false;
              pm_2.Visible := False;
              pm_ArmModeChange.Visible := False;
              pm_DisArmModeChange.Visible := False;
              pm_3.Visible := False;
              pm_LargeIcon.Visible := False;
              pm_4.Visible := False;
              pm_DeviceInfo.Visible := False;
              pm_DeviceInfo.Visible := False;
              pm_AlarmReport.Visible := False;
              pm_6.Visible := True;
              pm_CCTV1.Visible := True;
            end else
            begin
              pm_1.Visible := True;
              pm_AlarmConfirm.Visible := True;
              pm_ArmAreaStateSearch.Visible := True;
              pm_2.Visible := True;
              pm_ArmModeChange.Visible := True;
              pm_DisArmModeChange.Visible := True;
              pm_3.Visible := True;
              pm_LargeIcon.Visible := True;
              pm_4.Visible := True;
              pm_DeviceInfo.Visible := True;
              pm_DeviceInfo.Visible := True;
              pm_AlarmReport.Visible := True;
              pm_6.Visible := False;
              pm_CCTV1.Visible := False;
            end;

            if AlarmEventCodeList.IndexOf(myData.ArmAreaID) > -1 then continue;
          end;
          ImageEnVect1.ObjTransparency[hobj] := 250;
        end;
      end else
      begin
        if FormTYPE = 'BUILDING' then
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            if AlarmEventCodeList.IndexOf(mydata.BuildingID) > -1 then continue;
          end;
          ImageEnVect1.ObjTransparency[hobj] := 0;
        end else
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            if AlarmEventCodeList.IndexOf(mydata.ArmAreaID) > -1 then continue;
          end;
          ImageEnVect1.ObjTransparency[hobj] := 100;
        end;
      end;
    end;
end;

procedure TfmMapArmAreaState.ImageEnVect1ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapArmAreaStateZoom' + BuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapArmAreaStateFit' + BuildingCode,0);
    end;
  Finally
    ini_fun.Free;
  End;
  L_bImageFit := False;
end;

procedure TfmMapArmAreaState.LoadMap;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
  nZoomSize : integer;
  i : integer;
  hobj : integer;
  mydata:PMyData;
  Stream: TStream;
  oMapAlarm : TMapAlarm;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  if SubCodeList.Count > 0 then
  begin
    for i := SubCodeList.Count - 1 downto 0 do
    begin
      TMapAlarm(SubCodeList.Objects[i]).Free;
      SubCodeList.Delete(i);
    end;
  end;
  SubCodeList.Clear;

  if ImageEnVect1.ObjectsCount > 0 then
  begin
    for i := ImageEnVect1.ObjectsCount - 1 downto 0 do
    begin
      hobj := ImageEnVect1.GetObjFromIndex( i );
      ImageEnVect1.RemoveObject(hobj);
    end;
  end;
  ImageEnVect1.Clear;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      nZoomSize := ReadInteger('Image','MapArmAreaStateZoom' + BuildingCode,100);
      if ReadInteger('Image','MapArmAreaStateFit' + BuildingCode,1) = 1 then L_bImageFit := True
      else L_bImageFit := False;
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\' + BuildingCode + '.jpg') then DeleteFile(G_stExeFolder + '\' + BuildingCode + '.jpg');     //���� ����
  if FileExists(G_stExeFolder + '\' + BuildingCode + '.iev') then DeleteFile(G_stExeFolder + '\' + BuildingCode + '.iev');
  //���⼭ �̹��� �ε� ����.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_MAP,lo_export(TB_BUILDINGMAP.BM_MAP, ' + G_stExeFolder + '\\' + BuildingCode + '.jpg''),lo_export(TB_BUILDINGMAP.BM_MAPINFO, ' + G_stExeFolder + '\\' + BuildingCode + '.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + BuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + BuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end;

    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if Not FindField('BM_MAP').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAP'), G_stExeFolder + '\' + BuildingCode + '.jpg');
          end;
        end;
        if Not FindField('BM_MAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAPINFO'), G_stExeFolder + '\' + BuildingCode + '.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\' + BuildingCode + '.jpg') then
  begin
    // load the bitmap
    ImageEnVect1.IO.LoadFromFile( G_stExeFolder + '\' + BuildingCode + '.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\' + BuildingCode + '.iev' ) then
      ImageEnVect1.LoadFromFileIEV( G_stExeFolder + '\' + BuildingCode + '.iev' );
    //
    ImageEnVect1.ObjGripPen.Style := psClear;
    ImageEnVect1.ObjGripBrush.Style := bsclear;

//    showmessage(inttostr(ImageEnVect1.Height) + '/' + inttostr(ImageEnVect1.Width));
    ImageEnVect1.Zoom := nZoomSize;
    for i := 0 to ImageEnVect1.ObjectsCount - 1 do
    begin
      hobj := ImageEnVect1.GetObjFromIndex( i );
      mydata:=ImageEnVect1.ObjUserData[ hobj ];
      if mydata<>nil then
      begin
        if FormTYPE = 'BUILDING' then
        begin
          if SubCodeList.IndexOf(mydata.BuildingID) < 0 then
          begin
            oMapAlarm := TMapAlarm.Create(nil) ;
            oMapAlarm.Code := mydata.BuildingID;
            oMapAlarm.hobj := hobj;
            oMapAlarm.Name := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(mydata.BuildingID);
            mydata^.BuildingName := oMapAlarm.Name;
            ImageEnVect1.ObjUserData[hobj]:=mydata;
            ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);
            SubCodeList.AddObject(mydata.BuildingID,oMapAlarm);
          end;
        end else if FormTYPE = 'ALARM' then
        begin
          if SubCodeList.IndexOf(mydata.ArmAreaID) < 0 then
          begin
            oMapAlarm := TMapAlarm.Create(nil) ;
            oMapAlarm.Code := mydata.ArmAreaID;
            oMapAlarm.hobj := hobj;
            if copy(mydata.ArmAreaID,1,1) = 'C' then //CCTV �̸�
              oMapAlarm.Name := dmDBFunction.GetTB_CCTV_Name(copy(mydata.ArmAreaID,2,G_nNodeCodeLength))
            else oMapAlarm.Name := dmDBFunction.GetTB_ARMAREA_ArmAreaName(copy(mydata.ArmAreaID,1,G_nNodeCodeLength),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1));
            mydata^.ArmAreaName := oMapAlarm.Name;
            ImageEnVect1.ObjUserData[hobj]:=mydata;
            ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);

            stNodeNo := copy(mydata.ArmAreaID,1,G_nNodeCodeLength);
            stEcuID := copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2);
            stArmAreaNo := copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1);
            nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
            if nIndex > -1 then
            begin
              if TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaArmMode,stEcuID,stArmAreaNo) = 'A' then
              begin
                ImageEnVect1.ObjBrushColor[hobj] := mydata.ArmColor;
                ImageEnVect1.ObjPenColor[hobj] := mydata.ArmColor;
              end else
              begin
                ImageEnVect1.ObjBrushColor[hobj] := mydata.DisArmColor;
                ImageEnVect1.ObjPenColor[hobj] := mydata.DisArmColor;
              end;
            end;
            SubCodeList.AddObject(mydata.ArmAreaID,oMapAlarm);
          end;
        end;
      end;
    end;
    if L_bImageFit then
    begin
      ImageEnVect1.Fit;
      mn_ImageFit.Checked := True;
      mn_ImageOrg.Checked := False;
    end else
    begin
      mn_ImageFit.Checked := False;
      mn_ImageOrg.Checked := False;
      if nZoomSize = 100 then mn_ImageOrg.Checked := True;
    end;
  end;
  fmMain.FORMALARMCONFIRMExecute;
end;

procedure TfmMapArmAreaState.mn_ImageOrgClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := 100;
  L_bImageFit := False;
  mn_ImageFit.Checked := False;
  mn_ImageOrg.Checked := True;
end;

procedure TfmMapArmAreaState.PageCCTVDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  inherited;
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
//  if (Sender as TAdvPageControl).DockClientCount = 1 then
//    ShowDockPageControl(Sender as TAdvPageControl, True, nil);
//  (Sender as TAdvPageControl).DockManager.ResetBounds(True);
  //Make DockManager repaints it's clients.

end;

procedure TfmMapArmAreaState.PageCCTVDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := PageCCTV.ClientToScreen(Point(0, 0));
//    ARect.BottomRight := LeftDockPanel.ClientToScreen(Point(Self.ClientWidth div 3, LeftDockPanel.Height));
    ARect.BottomRight := PageCCTV.ClientToScreen(Point(Self.ClientWidth div 3, Self.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TfmMapArmAreaState.PageCCTVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT ����
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE ����
        MouseDowning := True;
    end else MouseDowning := False;

end;

procedure TfmMapArmAreaState.PageCCTVMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
      if ((Sender as TAdvPageControl).Top + (Sender as TAdvPageControl).Height) >= (ImageEnVect1.Height) then
      begin
        (Sender as TAdvPageControl).Top := (ImageEnVect1.Height) - (Sender as TAdvPageControl).Height - 1;
      end
      else if ((Sender as TAdvPageControl).Left + (Sender as TAdvPageControl).Width) >= (ImageEnVect1.Width ) then
      begin
        (Sender as TAdvPageControl).Left := (ImageEnVect1.Width) - (Sender as TAdvPageControl).Width - 1;
      end
      else
      begin
        // IMAGE TOP ��ġ ����
        (Sender as TAdvPageControl).Top := (Sender as TAdvPageControl).Top + Y - DragOrigin.Y;
        // IMAGE LEFT ��ġ ����
        (Sender as TAdvPageControl).Left := (Sender as TAdvPageControl).Left + X - DragOrigin.X;
      end;
    end;
end;

procedure TfmMapArmAreaState.PageCCTVMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE ����
  MouseDowning := False;

end;

procedure TfmMapArmAreaState.PageCCTVUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
  inherited;
  if PageCCTV.PageCount < 2 then  PageCCTV.Visible := False;

end;

procedure TfmMapArmAreaState.pm_AlarmConfirmClick(Sender: TObject);
begin
  Try
    fmBuildingAlarmConfirm := TfmBuildingAlarmConfirm.create(Self);
    fmBuildingAlarmConfirm.FormTYPE := FormType;
    fmBuildingAlarmConfirm.SearchID := L_stSelectCode;
    fmBuildingAlarmConfirm.ShowModal;
    if fmBuildingAlarmConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;
    fmBuildingAlarmConfirm.Free;
  Except
    Exit;
  End;

end;

procedure TfmMapArmAreaState.pm_AlarmReportClick(Sender: TObject);
begin
  Try
    fmMain.FORMREPORT(con_FormBMOSALARMEVENTREPORT,FormTYPE,L_stSelectCode);
  Except
    Exit;
  End;

end;

procedure TfmMapArmAreaState.pm_ArmAreaStateSearchClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  nIndex : integer;
begin
  Try
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    //dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapArmAreaState.pm_ArmModeChangeClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'A';
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;

end;

procedure TfmMapArmAreaState.pm_CCTV1Click(Sender: TObject);
var
  stCCTVSeq : string;
  stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw : string;
begin
  Try
    stCCTVSeq := L_stSelectCode;
    if stCCTVSeq[1] <> 'C' then Exit; //CCTV�� �ƴϸ� ���� ������.
    Delete(stCCTVSeq,1,1); //'C' ����
    if Not dmDBFunction.GetTB_CCTV_Info(stCCTVSeq,stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw) then
    begin
      showmessage('CCTV ������ �߸� �Ǿ����ϴ�.');
      Exit;
    end;
    CreateDockableWindows(stCCTVSeq,stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw);
    ShowDockableWindows(stCCTVSeq);
  Except
    Exit;
  End;

end;

procedure TfmMapArmAreaState.pm_DeviceInfoClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stTelNo : string;
  stMemo : string;
  stBuildingName : string;
begin
  stArmAreaID:= L_stSelectCode;
  stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
  stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
  stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
  lb_ArmAreaName.Caption := dmDBFunction.GetTB_ARMAREA_ArmAreaName(stNodeNo,stEcuID,stArmAreaNo);
  ed_NodeIP.Text := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_ArmAreaNo.Caption := stArmAreaNo;
  dmDBFunction.GetTB_ARMAREA_BuildingInfo(stNodeNo,stEcuID,stArmAreaNo,stBuildingName,stTelNo,stMemo);
  //lb_Building.Caption := dmDBFunction.GetTB_ARMAREA_BuildingName(stNodeNo,stEcuID,stArmAreaNo);
  lb_TelNo.Caption := stTelNo;
  memo1.Text := stMemo;
  pan_DoorInfo.Visible := True;
  pan_DoorInfo.Caption.Text := pm_DeviceInfo.Caption;

end;

procedure TfmMapArmAreaState.pm_DisArmModeChangeClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'D';
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;
end;

procedure TfmMapArmAreaState.SecurityEventClear;
var
  i,hobj:integer;
  mydata:PMyData;
  stAlarmID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  AlarmEventCodeList.Clear;
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      mydata:=ImageEnVect1.ObjUserData[ hobj ];
      if mydata <> nil then
      begin
        if FormTYPE = 'BUILDING' then
        begin
          ObjBrushColor[hobj] := mydata.NormalColor;
        end else
        begin
          stAlarmID := mydata.ArmAreaID;
          stNodeNo := copy(stAlarmID,1,G_nNodeCodeLength);
          stEcuID := copy(stAlarmID,1 + G_nNodeCodeLength,2);
          stArmAreaNo := copy(stAlarmID,1 + G_nNodeCodeLength + 2,1);
          nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            if TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaArmMode,stEcuID,stArmAreaNo) = 'A' then
            begin
              ObjBrushColor[hobj] := mydata.ArmColor;
              ObjPenColor[hobj] := mydata.ArmColor;
            end else
            begin
              ObjBrushColor[hobj] := mydata.DisArmColor;
              ObjPenColor[hobj] := mydata.DisArmColor;
            end;
          end;
        end;
      end;
    end;
end;

procedure TfmMapArmAreaState.SetParentLeft(const Value: integer);
begin
  FParentLeft := Value;
end;

procedure TfmMapArmAreaState.ShowDockableWindows(aCCTVSeq:string);
var
  i : integer;
  DockWindow : TfmCCTV;
  DockTapSheet : TTabSheet;
  nIndex : integer;
begin
  nIndex := CCTVFormList.IndexOf(aCCTVSeq);
  if nIndex < 0 then Exit;
  //PageCCTV.Visible := True;
  DockWindow := TfmCCTV(CCTVFormList.Objects[nIndex]);
  if (DockWindow.HostDockSite is TPanel) and
    ((DockWindow.HostDockSite.Height = 0) or (DockWindow.HostDockSite.Width = 0)) then
    ShowDockPanel(DockWindow.HostDockSite as TPanel, True, DockWindow)
  else
    //if the window isn't docked at all, simply show it.
    DockWindow.Show;

  While Not DockWindow.L_bFormActive do
  begin
    Delay(1);
    Application.ProcessMessages;
  end;

  //DockWindow.ManualDock(PageCCTV,DockWindow,alClient);
  DockWindow.SocketConnect := True;
end;

procedure TfmMapArmAreaState.ShowDockPageControl(APageControl: TAdvPageControl;
  MakeVisible: Boolean; Client: TControl);
begin
  inherited;
  if not MakeVisible and (APageControl.VisibleDockClientCount > 1) then
    Exit;

  if MakeVisible and (Client <> nil) then Client.Show
  else if Not MakeVisible then
  begin
    if PageCCTV.PageCount < 2 then  PageCCTV.Visible := False;
  end;

end;

procedure TfmMapArmAreaState.ShowDockPanel(APanel: TPanel; MakeVisible: Boolean;
  Client: TControl);
begin
inherited ;
  //Client - the docked client to show if we are re-showing the panel.
  //Client is ignored if hiding the panel.

  //Since docking to a non-visible docksite isn't allowed, instead of setting
  //Visible for the panels we set the width to zero. The default InfluenceRect
  //for a control extends a few pixels beyond it's boundaries, so it is possible
  //to dock to zero width controls.

  //Don't try to hide a panel which has visible dock clients.
  if not MakeVisible and (APanel.VisibleDockClientCount > 1) then
    Exit;

  if MakeVisible and (Client <> nil) then Client.Show
  else if Not MakeVisible then
  begin
    if PageCCTV.PageCount < 2 then  PageCCTV.Visible := False;
  end;
end;

procedure TfmMapArmAreaState.mn_ImageFitClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  inherited;
  ImageEnVect1.Fit;
  L_bImageFit := True;
  if L_bImageFit then
  begin
    ImageEnVect1.Fit;
    mn_ImageFit.Checked := True;
    mn_ImageOrg.Checked := False;
  end;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapArmAreaStateZoom' + BuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapArmAreaStateFit' + BuildingCode,1);
    end;
  Finally
    ini_fun.Free;
  End;
end;

function TfmMapArmAreaState.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
var
  DockTopRect,
  DockLeftRect,
  DockBottomRect,
  DockRightRect,
  DockCenterRect: TRect;
begin
  Result := alNone;
  //divide form up into docking "Zones"
  DockLeftRect.TopLeft := Point(0, 0);
  DockLeftRect.BottomRight := Point(ClientWidth div 5, ClientHeight);

  DockTopRect.TopLeft := Point(ClientWidth div 5, 0);
  DockTopRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5);

  DockRightRect.TopLeft := Point(ClientWidth div 5 * 4, 0);
  DockRightRect.BottomRight := Point(ClientWidth, ClientHeight);

  DockBottomRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5 * 4);
  DockBottomRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight);

  DockCenterRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5);
  DockCenterRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5 * 4);

  //Find out where the mouse cursor is, to decide where to draw dock preview.
  if PtInRect(DockLeftRect, MousePos) then
  begin
    Result := alLeft;
    DockRect := DockLeftRect;
    DockRect.Right := ClientWidth div 2;
  end
  else
  if PtInRect(DockTopRect, MousePos) then
  begin
    Result := alTop;
    DockRect := DockTopRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Bottom := ClientHeight div 2;
  end
  else
  if PtInRect(DockRightRect, MousePos) then
  begin
    Result := alRight;
    DockRect := DockRightRect;
    DockRect.Left := ClientWidth div 2;
  end
  else
  if PtInRect(DockBottomRect, MousePos) then
  begin
    Result := alBottom;
    DockRect := DockBottomRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Top := ClientHeight div 2;
 end
  else
  if PtInRect(DockCenterRect, MousePos) then
  begin
    Result := alClient;
    DockRect := DockCenterRect;
  end;
  if Result = alNone then Exit;

  //DockRect is in screen coordinates.
  DockRect.TopLeft := ClientToScreen(DockRect.TopLeft);
  DockRect.BottomRight := ClientToScreen(DockRect.BottomRight);
end;

procedure TfmMapArmAreaState.CreateDockableWindows(aCCTVSeq,aCCTVIP,aCCTVPort,aCCTVName,aCCTVUserID,aCCTVUserPw:string);
var
  I: Integer;
  oCCTVForm : TfmCCTV;
  stBuildingCode : string;
  nIndex : integer;
begin
  if FormTYPE <> 'BUILDING' then
  begin
    nIndex := CCTVFormList.IndexOf(aCCTVSeq);
    if nIndex < 0 then
    begin
      oCCTVForm := TfmCCTV.Create(nil);
      oCCTVForm.Caption := aCCTVName;
      oCCTVForm.CCTVIP := aCCTVIP;
      oCCTVForm.CCTVPort := aCCTVPort;
      oCCTVForm.CCTVUserID := aCCTVUserID;
      oCCTVForm.CCTVUserPW := aCCTVUserPw;
      oCCTVForm.CCTVName := aCCTVName;
      oCCTVForm.fmParent := self;
      oCCTVForm.Top := ParentTop + 110 + (CCTVFormList.Count * 20);
      oCCTVForm.Left := ParentLeft + 30;
      CCTVFormList.AddObject(aCCTVSeq,oCCTVForm);
    end;
  end;
end;

procedure TfmMapArmAreaState.DeviceReload;
begin

end;

procedure TfmMapArmAreaState.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
begin
end;

procedure TfmMapArmAreaState.AlarmTimerTimer(Sender: TObject);
var
  i : integer;
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
begin
  inherited;
  if AlarmEventCodeList.Count < 1 then Exit;
  L_bAlarmTrigger := Not L_bAlarmTrigger;

  for i := 0 to AlarmEventCodeList.Count - 1 do
  begin
    stArmAreaID := AlarmEventCodeList.Strings[i];
    nIndex := SubCodeList.IndexOf(stArmAreaID);
    if nIndex > -1 then
    begin
      hobj := TMapAlarm(SubCodeList.Objects[nIndex]).hobj;
      if L_bAlarmTrigger then
        ImageEnVect1.ObjTransparency[hobj] := 250
      else ImageEnVect1.ObjTransparency[hobj] := 50;
    end;
  end;
end;


procedure TfmMapArmAreaState.ArmAreaCurrentAlarmStateChange(aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stCCTVSeq : string;
  stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw : string;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := SubCodeList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if aAlarmState = '3' then
  begin
    if AlarmEventCodeList.IndexOf(stArmAreaID) < 0  then
    begin
      AlarmEventCodeList.Add(stArmAreaID);
      hobj := TMapAlarm(SubCodeList.Objects[nIndex]).hobj;
      mydata:=ImageEnVect1.ObjUserData[ hobj ];
      if mydata <> nil then
      begin
        ImageEnVect1.ObjBrushColor[hobj] := mydata.AlarmColor;
        ImageEnVect1.ObjPenColor[hobj] := mydata.AlarmColor;
      end;
    end;
    stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
    stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
    if Not dmDBFunction.GetTB_ARMAREA_CCTVSeq(stNodeNo,stEcuID,stArmAreaNo,stCCTVSeq) then Exit;
    if Not dmDBFunction.GetTB_CCTV_Info(stCCTVSeq,stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw) then
    begin
      Exit;
    end;
    CreateDockableWindows(stCCTVSeq,stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw);
    ShowDockableWindows(stCCTVSeq);
  end;
end;

procedure TfmMapArmAreaState.ArmAreaSecurityModeChange(aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := SubCodeList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if AlarmEventCodeList.IndexOf(stArmAreaID) < 0  then
  begin
    hobj := TMapAlarm(SubCodeList.Objects[nIndex]).hobj;
    mydata:=ImageEnVect1.ObjUserData[ hobj ];
    if mydata <> nil then
    begin
      if aMode = 'A' then
      begin
        ImageEnVect1.ObjBrushColor[hobj] := mydata.ArmColor;
        ImageEnVect1.ObjPenColor[hobj] := mydata.ArmColor;
      end else
      begin
        ImageEnVect1.ObjBrushColor[hobj] := mydata.DisArmColor;
        ImageEnVect1.ObjPenColor[hobj] := mydata.DisArmColor;
      end;
    end;
  end;
end;

procedure TfmMapArmAreaState.BuildingAlarmStateChange(
  aBuildingCode: string; aAlarmState: integer);
var
  nIndex : integer;
  hobj : integer;
  mydata:PMyData;
begin
  if FormTYPE <> 'BUILDING' then Exit;
  if aAlarmState = 3 then
  begin
    if AlarmEventCodeList.IndexOf(aBuildingCode) < 0  then
    begin
      AlarmEventCodeList.Add(aBuildingCode);
      nIndex := SubCodeList.IndexOf(aBuildingCode);
      if nIndex > -1 then
      begin
        hobj := TMapAlarm(SubCodeList.Objects[nIndex]).hobj;
        mydata:=ImageEnVect1.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
          ImageEnVect1.ObjBrushColor[hobj] := mydata.AlarmColor;
          ImageEnVect1.ObjPenColor[hobj] := mydata.AlarmColor;
        end;
      end;
    end;
  end;
end;

procedure TfmMapArmAreaState.BuildingSecurityModeChange(
  aBuildingCode: string; aMode: integer);
begin
  if FormTYPE <> 'BUILDING' then Exit;

end;

procedure TfmMapArmAreaState.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmMapArmAreaState.FormActivate(Sender: TObject);
begin
  L_bFormActive := True;
end;

procedure TfmMapArmAreaState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SubCodeList.Free;
  AlarmEventCodeList.Free;
  CCTVFormList.Free;

  //the action taken depends on how the form is docked.

  //if docked to a panel, tell the panel to hide itself. If there are other
  //visible dock clients on the panel, it ShowDockPanel won't allow it to
  //be hidden
  if (HostDockSite is TPanel) then
    fmParent.ShowDockPanel(HostDockSite as TPanel, False, nil);

  Action := caHide;

  if not Floating and FloatOnCloseDock then
  begin
    // Float when close docked window
    Hide;
    ManualFloat(Rect(FUndockedLeft, FUndockedTop, FUndockedLeft + UndockWidth,
      FUndockedTop + UndockHeight));
  end;
end;

procedure TfmMapArmAreaState.FormCreate(Sender: TObject);
begin
  SubCodeList := TStringList.Create;
  AlarmEventCodeList := TStringList.Create;
  CCTVFormList := TStringList.Create;
  FontSetting;
end;

procedure TfmMapArmAreaState.AdvSmoothButton1Click(Sender: TObject);
begin
  pan_DoorInfo.Visible := False;
end;

procedure TfmMapArmAreaState.CMDockClient(var Message: TCMDockClient);
var
  ARect: TRect;
  DockType: TAlign;
  Host: TForm;
  Pt: TPoint;
begin
  //Overriding this message allows the dock form to create host forms
  //depending on the mouse position when docking occurs. If we don't override
  //this message, the form will use VCL's default DockManager.

  //NOTE: the only time ManualDock can be safely called during a drag
  //operation is we override processing of CM_DOCKCLIENT.
  if Message.DockSource.Control is Tform then
  begin
    //Find out how to dock (Using a TAlign as the result of ComputeDockingRect)
    Pt.X := Message.MousePos.X;
    Pt.Y := Message.MousePos.Y;
    DockType := ComputeDockingRect(ARect, Pt);

    //if we are over a dockable form docked to a panel in the
    //main window, manually dock the dragged form to the panel with
    //the correct orientation.
    if (HostDockSite is TPanel) then
    begin
      Message.DockSource.Control.ManualDock(HostDockSite, nil, DockType);
      Exit;
    end;
  end;
end;

procedure TfmMapArmAreaState.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

procedure TfmMapArmAreaState.WMNCLButtonUp(var Msg: TMessage);
begin
  MouseDowning := False;
end;

end.