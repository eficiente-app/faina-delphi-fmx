unit Tarefa.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components;

type
  TTarefaView = class(TForm)
    lytTarefaView: TLayout;
    rctgTarefaView: TRectangle;
    lytTopoClient: TLayout;
    lytTarefaViewClient: TLayout;
    lytTitulo: TLayout;
    edtTitulo: TEdit;
    lytOpcoesPrincipais: TLayout;
    lytStatusTarefa: TLayout;
    lblStatusTarefa: TLabel;
    btnStatusTarefaDropDown: TSpeedButton;
    lnTitulo: TLine;
    lytCronograma: TLayout;
    lblCronograma: TLabel;
    rctgCorStatusTarefa: TRectangle;
    lytEtapa: TLayout;
    SpeedButton1: TSpeedButton;
    lblEpataTarefa: TLabel;
    btnControleEtapa: TSpeedButton;
    procedure edtTituloChange(Sender: TObject);
    procedure lblCronogramaResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblStatusTarefaResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TTarefaView.FormCreate(Sender: TObject);
begin
  edtTitulo.Text       := 'Minha primeira tarefa';
  lblStatusTarefa.Text := 'Em Análise';
  lblCronograma.Text   := '23-25 ago';
  rctgCorStatusTarefa.Fill.Color := TAlphaColorRec.Orange;
end;

procedure TTarefaView.edtTituloChange(Sender: TObject);
begin
  lblCronograma.Text := edtTitulo.Text;
end;

procedure TTarefaView.lblCronogramaResize(Sender: TObject);
begin
  lytCronograma.Size.Width := lblCronograma.Size.Width;
end;

procedure TTarefaView.lblStatusTarefaResize(Sender: TObject);
begin
  lytStatusTarefa.Size.Width := lblStatusTarefa.Size.Width + btnStatusTarefaDropDown.Size.Width;
end;

end.
