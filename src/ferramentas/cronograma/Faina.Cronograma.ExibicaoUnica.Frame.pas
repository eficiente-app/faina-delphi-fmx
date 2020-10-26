unit Faina.Cronograma.ExibicaoUnica.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.SVGIconImage;

type
  TframeCronogramaExibicaoUnica = class(TFrame)
    lytCronogramaExibicaoUnica: TLayout;
    rctgCronogramaExibicaoUnica: TRectangle;
    lytClient: TLayout;
    lblInicio: TLabel;
    lblSeparador: TLabel;
    lblFim: TLabel;
    lblQuantificador: TLabel;
    SVGIconImage1: TSVGIconImage;
    procedure lblInicioMouseEnter(Sender: TObject);
    procedure lblInicioMouseLeave(Sender: TObject);
    procedure SVGIconImage1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TframeCronogramaExibicaoUnica.lblInicioMouseEnter(Sender: TObject);
begin
  TLabel(Sender).TextSettings.FontColor := TAlphaColorRec.Mediumblue;
end;

procedure TframeCronogramaExibicaoUnica.lblInicioMouseLeave(Sender: TObject);
begin
  TLabel(Sender).TextSettings.FontColor := TAlphaColorRec.Black;
end;

procedure TframeCronogramaExibicaoUnica.SVGIconImage1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  SVGIconImage1.BeginUpdate;
  try
    TSVGIconFixedBitmapItem(SVGIconImage1.MultiResBitmap.Items[0]).DrawSVGIcon;
  finally
    SVGIconImage1.EndUpdate;
  end;
end;

end.
