unit uEmployeeFileBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.StdCtrls, AdvEdit,
  AdvSmoothLabel, AdvSmoothPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfmEmployeeFileBackup = class(TForm)
    AdvSmoothPanel2: TAdvSmoothPanel;
    lb_PositionSearch: TAdvSmoothLabel;
    lb_EmployeeGubunSearch: TAdvSmoothLabel;
    lb_EtcDetail: TAdvSmoothLabel;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_PositionSearch: TComboBox;
    cmb_EmpGubunSearch: TComboBox;
    ed_etcSearch: TAdvEdit;
    cmb_EtcSearch: TComboBox;
    ed_SerchSelectCompanyCode: TAdvEdit;
    btn_Search: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    pan_EmployeeList: TAdvSmoothPanel;
    sg_EmployeeList: TAdvStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEmployeeFileBackup: TfmEmployeeFileBackup;

implementation

{$R *.dfm}

end.
