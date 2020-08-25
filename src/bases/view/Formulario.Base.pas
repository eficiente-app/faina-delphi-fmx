unit Formulario.Base;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs, FMX.Layouts, FMX.Objects;

type
  TFormularioBase = class(TForm)
  private
    { Private declarations }
    FLytShowModal: TLayout;
    FRctShowModal: TRectangle;
  public
    { Public declarations }
    procedure ShowModal(AControl: TControl); reintroduce;
  end;

var
  FormularioBase: TFormularioBase;

implementation

{$R *.fmx}

{ TFormularioBase }

procedure TFormularioBase.ShowModal(AControl: TControl);
begin
  FLytShowModal := TLayout.Create(Self);
  FLytShowModal.Parent := Self;
  FLytShowModal.Align  := TAlignLayout.Client;
  FLytShowModal.BringToFront;
  FRctShowModal := TRectangle.Create(FLytShowModal);
  FRctShowModal.Parent := FLytShowModal;
  FRctShowModal.Align := TAlignLayout.Client;
  FRctShowModal.Stroke.Kind := TBrushKind.None;
  FRctShowModal.Fill.Color := $96000000;
  FRctShowModal.BringToFront;

  AControl.Parent := FRctShowModal;
  AControl.Align  := TAlignLayout.Center;
end;

end.
