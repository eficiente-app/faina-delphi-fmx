// Daniel Araujo - 2020-08-22
unit Principal.View;

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
  FMX.Dialogs,
  Formulario.Base, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Calendar;

type
  TPrincipalView = class(TFormularioBase)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalView: TPrincipalView;

implementation

uses
  Tarefa.View, Faina.Calendario.Mes.Frame;

{$R *.fmx}

procedure TPrincipalView.FormCreate(Sender: TObject);
begin
//  with TCalendarioMesFrame.Create(Self) do
//  begin
//    Parent := Self;
//    Align := TAlignLayout.Center;
//    MesDaData(Now)
//  end;
//  with TTarefaView.Create(Self) do
//  begin
//    lytTarefaView.Align := TAlignLayout.None;
//    lytTarefaView.Width := 900;
//    lytTarefaView.Height := 700;
//    Self.ShowModal(lytTarefaView);
//  end;
end;

end.
