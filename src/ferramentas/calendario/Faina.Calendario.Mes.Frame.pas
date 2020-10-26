unit Faina.Calendario.Mes.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, System.Generics.Collections, Faina.Calendario.Dia.Frame,
  System.DateUtils;

type
  TPrimeiroDiaSemana = (
    Segunda =  1,
    Terca = 2,
    Quarta = 3,
    Quinta = 4,
    Sexta = 5,
    Sabado = 6,
    Domingo = 7,
    Padraolocal = 8
  );
  TCalendarioMesFrame = class(TFrame)
    lytCalendarioMes: TLayout;
    rctgCalendarioMes: TRectangle;
    lytNavegacaoTopo: TLayout;
    lytDiasMes: TLayout;
    glytDias: TGridLayout;
    glytTituloDias: TGridLayout;
    procedure FrameResize(Sender: TObject);
    procedure glytDiasResize(Sender: TObject);
  private
    { Private declarations }
    FMesData: TDateTime;
    FDias: TDictionary<Integer, TCalendarioDiaFrame>;
    FPrimeiroDiaSemana: TPrimeiroDiaSemana;
    procedure CriarDias;
    procedure DefinirTamanhoItens;
    procedure DoOnDiaItemPaint(Sender: TCalendarioDiaFrame);
    procedure DoOnDiaItemClick(Sender: TCalendarioDiaFrame);
    procedure DoOnDiaItemDblClick(Sender: TCalendarioDiaFrame);
    procedure DoOnDiaItemMouseEnter(Sender: TCalendarioDiaFrame);
    procedure DoOnDiaItemMouseLeave(Sender: TCalendarioDiaFrame);


  public
    { Public declarations }
    const DiasPorSemana = DaysPerWeek;
    const SemanasPorMes = 6;
    const DiasNoCalendario = Pred(DiasPorSemana * SemanasPorMes);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PrimeiroDiaSemana(Value: TPrimeiroDiaSemana): TCalendarioMesFrame;
    function MesDaData(Value: TDateTime): TCalendarioMesFrame;
  end;

implementation

{$R *.fmx}

constructor TCalendarioMesFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDias := TDictionary<Integer, TCalendarioDiaFrame>.Create;
  CriarDias;
end;

destructor TCalendarioMesFrame.Destroy;
begin
  FreeAndNil(FDias);
  inherited;
end;

function TCalendarioMesFrame.MesDaData(Value: TDateTime): TCalendarioMesFrame;
var
  dtValue: TDateTime;
  iDia: Integer;
begin
  Result := Self;
  FMesData := Value;
  // Obtém o Primeiro dia do Mes
  dtValue := IncDay(Value, - Pred(DayOf(Value)));
  // Subtraí o equivalente ao dia da semana para iniciar no começo da semana
  dtValue := IncDay(dtValue, - Pred(DayOfWeek(dtValue)));
  // Percorre a lista de datas do calendário
  for iDia := 0 to Pred(FDias.Count) do
  try
    // Obtém o Obtjeto Dia
    with FDias.Items[iDia] do
    begin
      // Atribui a data
      Data(dtValue);
      DoOnDiaItemPaint(FDias.Items[iDia]);
    end;
  finally
    dtValue := IncDay(dtValue);
  end;
end;

function TCalendarioMesFrame.PrimeiroDiaSemana(Value: TPrimeiroDiaSemana): TCalendarioMesFrame;
begin
  Result := Self;
  FPrimeiroDiaSemana := Value;
end;

procedure TCalendarioMesFrame.FrameResize(Sender: TObject);
begin
  DefinirTamanhoItens;
end;

procedure TCalendarioMesFrame.glytDiasResize(Sender: TObject);
begin
  DefinirTamanhoItens;
end;

procedure TCalendarioMesFrame.CriarDias;
var
  I: Integer;
  Dia: TCalendarioDiaFrame;
begin
  for I := 0 to DiasNoCalendario do
  begin
    Dia := TCalendarioDiaFrame.Create(glytDias);
    Dia.OnClick := DoOnDiaItemClick;
    Dia.OnDblClick := DoOnDiaItemDblClick;
    Dia.OnMouseEnter := DoOnDiaItemMouseEnter;
    Dia.OnMouseLeave := DoOnDiaItemMouseLeave;
    Dia.OnPaint := DoOnDiaItemClick;
    Dia.Name := 'Dia_' + I.ToString;
    FDias.Add(I, Dia);
  end;
end;

procedure TCalendarioMesFrame.DefinirTamanhoItens;
var
  iItemH: Single;
  iItemW: Single;
begin
  iItemH := (glytDias.Height - 1) / SemanasPorMes;
  iItemW := (glytDias.Width - 1) / DiasPorSemana;
  if iItemH < 25 then
    iItemH := 25;
  if iItemW < 25 then
    iItemW := 25;

  glytDias.ItemHeight := iItemH;
  glytDias.ItemWidth  := iItemW;
end;

procedure TCalendarioMesFrame.DoOnDiaItemClick(Sender: TCalendarioDiaFrame);
begin
  ShowMessage('Clique no dia: '+ FormatDateTime('dd/mm/yyyy', Sender.Data));
end;

procedure TCalendarioMesFrame.DoOnDiaItemDblClick(Sender: TCalendarioDiaFrame);
begin
  ShowMessage('Duplo Clique no dia: '+ FormatDateTime('dd/mm/yyyy', Sender.Data));
end;

procedure TCalendarioMesFrame.DoOnDiaItemMouseEnter(Sender: TCalendarioDiaFrame);
begin
  ShowMessage('Mouse enter no dia: '+ FormatDateTime('dd/mm/yyyy', Sender.Data));
end;

procedure TCalendarioMesFrame.DoOnDiaItemMouseLeave(Sender: TCalendarioDiaFrame);
begin
  ShowMessage('Mouse Leav no dia: '+ FormatDateTime('dd/mm/yyyy', Sender.Data));
end;

procedure TCalendarioMesFrame.DoOnDiaItemPaint(Sender: TCalendarioDiaFrame);
begin
  // Formatação de cores equivalentes
  if Trunc(Sender.Data) = Trunc(Now) then
    Sender.crclCalendarioDia.Fill.Color := TAlphaColorRec.Blue
  else
  if MonthOf(FMesData) = MonthOf(Sender.Data) then
    Sender.crclCalendarioDia.Fill.Color := TAlphaColorRec.White
  else
    Sender.crclCalendarioDia.Fill.Color := TAlphaColorRec.Grey;
end;

end.
