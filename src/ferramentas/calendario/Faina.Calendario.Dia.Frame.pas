unit Faina.Calendario.Dia.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, System.DateUtils;

type
  TCalendarioDiaFrame = class;
  TCalendarioDiaFrameNotifyEvent = procedure(Sender: TCalendarioDiaFrame) of Object;
  TCalendarioDiaFrame = class(TFrame)
    lytCalendarioDia: TLayout;
    lblDia: TLabel;
    crclCalendarioDia: TCircle;
    procedure crclCalendarioDiaMouseEnter(Sender: TObject);
    procedure crclCalendarioDiaMouseLeave(Sender: TObject);
    procedure crclCalendarioDiaClick(Sender: TObject);
    procedure crclCalendarioDiaDblClick(Sender: TObject);
  private
    { Private declarations }
    FDia: TDateTime;

    FOnMouseEnter: TCalendarioDiaFrameNotifyEvent;
    FOnDblClick: TCalendarioDiaFrameNotifyEvent;
    FOnMouseLeave: TCalendarioDiaFrameNotifyEvent;
    FOnClick: TCalendarioDiaFrameNotifyEvent;
    FOnPaint: TCalendarioDiaFrameNotifyEvent;
  protected
    procedure DoOnClick;
    procedure DoOnDblClick;
    procedure DoOnMouseEnter;
    procedure DoOnMouseLeave;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function Data: TDateTime; overload;
    function Data(Value: TDateTime): TCalendarioDiaFrame; overload;
    procedure AtualizarDia;

    property OnClick: TCalendarioDiaFrameNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TCalendarioDiaFrameNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseEnter: TCalendarioDiaFrameNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TCalendarioDiaFrameNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnPaint: TCalendarioDiaFrameNotifyEvent read FOnPaint write FOnPaint;
  end;

implementation

{$R *.fmx}

{ TCalendarioDiaFrame }

procedure TCalendarioDiaFrame.crclCalendarioDiaClick(Sender: TObject);
begin
  DoOnClick;
end;

procedure TCalendarioDiaFrame.crclCalendarioDiaDblClick(Sender: TObject);
begin
  DoOnDblClick;
end;

procedure TCalendarioDiaFrame.crclCalendarioDiaMouseEnter(Sender: TObject);
begin
  lblDia.TextSettings.FontColor := TAlphaColorRec.White;
  crclCalendarioDia.Fill.Color := TAlphaColorRec.Blue;
  DoOnMouseEnter;
end;

procedure TCalendarioDiaFrame.crclCalendarioDiaMouseLeave(Sender: TObject);
begin
  lblDia.TextSettings.FontColor := TAlphaColorRec.Black;
  crclCalendarioDia.Fill.Color := TAlphaColorRec.White;
  DoOnMouseLeave;
end;

constructor TCalendarioDiaFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Parent := TFmxObject(AOwner);
end;

function TCalendarioDiaFrame.Data(Value: TDateTime): TCalendarioDiaFrame;
begin
  Result := Self;
  FDia   := Value;
  AtualizarDia;
end;

procedure TCalendarioDiaFrame.AtualizarDia;
begin
  lblDia.Text := DayOf(FDia).ToString;
end;

function TCalendarioDiaFrame.Data: TDateTime;
begin
  Result := FDia;
end;

procedure TCalendarioDiaFrame.DoOnClick;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TCalendarioDiaFrame.DoOnDblClick;
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Self);
end;

procedure TCalendarioDiaFrame.DoOnMouseEnter;
begin
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TCalendarioDiaFrame.DoOnMouseLeave;
begin
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

end.
