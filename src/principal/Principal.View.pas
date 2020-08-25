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
  Formulario.Base, FMX.Controls.Presentation, FMX.StdCtrls;

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
  Tarefa.View;

{$R *.fmx}

procedure TPrincipalView.FormCreate(Sender: TObject);
begin
  with TTarefaView.Create(Self) do
  begin
    lytTarefaView.Align := TAlignLayout.None;
    lytTarefaView.Width := 300;
    lytTarefaView.Height := 500;
    Self.ShowModal(lytTarefaView);
  end;
end;

end.
