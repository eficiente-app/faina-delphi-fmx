unit Tarefa.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, FMX.ScrollBox, FMX.Memo,
  System.ImageList, FMX.ImgList, FMX.SVGIconImageList, FMX.SVGIconImage,
  Faina.Cronograma.ExibicaoUnica.Frame;

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
    rctgCorStatusTarefa: TRectangle;
    lytEtapa: TLayout;
    lytDescricao: TLayout;
    lytComentarios: TLayout;
    lblComentarios: TLabel;
    Line1: TLine;
    mmoDescricao: TMemo;
    lytBotoesTitulo: TLayout;
    SpeedButton2: TSpeedButton;
    svgilIcones: TSVGIconImageList;
    lytClassificacao: TLayout;
    lblClassificacao: TLabel;
    btnClassificacao: TSpeedButton;
    lytTipo: TLayout;
    lblTipo: TLabel;
    btnTipo: TSpeedButton;
    lytOpcoes2: TLayout;
    lytUsuarios: TLayout;
    lytUsuario: TLayout;
    rrctUsuario: TRoundRect;
    crclFotoUsuario: TCircle;
    lblNomeUsuario: TLabel;
    frameCronogramaExibicaoUnica1: TframeCronogramaExibicaoUnica;
    procedure edtTituloChange(Sender: TObject);
    procedure lblCronogramaResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblStatusTarefaResize(Sender: TObject);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure lblEpataTarefaResize(Sender: TObject);
    procedure lblTipoResize(Sender: TObject);
    procedure lblClassificacaoResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TTarefaView.edtTituloEnter(Sender: TObject);
begin
  lnTitulo.Visible := True;
end;

procedure TTarefaView.edtTituloExit(Sender: TObject);
begin
  lnTitulo.Visible := False;
end;

procedure TTarefaView.FormCreate(Sender: TObject);
begin
  edtTitulo.Text       := 'Minha primeira tarefa';
  lblStatusTarefa.Text := 'Em Análise';
//  lblCronograma.Text   := '23-25 ago';
  rctgCorStatusTarefa.Fill.Color := TAlphaColorRec.Orange;

//  with TSVGIconFixedBitmapItem(svgiCronograma.MultiResBitmap[0]) do
//  begin
//    SVG.LoadFromText(TSVGIconSourceItem(svgilIcones.Source.Items[1]).SVGText);
//    DrawSVGIcon;
//  end;
//  with TSVGIconFixedBitmapItem(svgiEtapas.MultiResBitmap[0]) do
//  begin
//    SVG.LoadFromText(TSVGIconSourceItem(svgilIcones.Source.Items[2]).SVGText);
//    DrawSVGIcon;
//  end;
end;

procedure TTarefaView.edtTituloChange(Sender: TObject);
begin
//  lblCronograma.Text := edtTitulo.Text;
end;

procedure TTarefaView.lblClassificacaoResize(Sender: TObject);
begin
  lytClassificacao.Width := lblClassificacao.Width + btnClassificacao.Width;
end;

procedure TTarefaView.lblCronogramaResize(Sender: TObject);
begin
//  lytCronograma.Size.Width := lblCronograma.Width + svgiCronograma.Width;
end;

procedure TTarefaView.lblEpataTarefaResize(Sender: TObject);
begin
//  lytEtapa.Size.Width := lblEpataTarefa.Width + svgiEtapas.Width;
end;

procedure TTarefaView.lblStatusTarefaResize(Sender: TObject);
begin
  lytStatusTarefa.Size.Width := lblStatusTarefa.Width + btnStatusTarefaDropDown.Width;
end;

procedure TTarefaView.lblTipoResize(Sender: TObject);
begin
  lytTipo.Width := lblTipo.Width + btnTipo.Width;
end;

end.
