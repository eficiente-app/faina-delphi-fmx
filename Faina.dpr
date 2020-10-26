program Faina;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal.View in 'src\principal\Principal.View.pas' {PrincipalView},
  Tarefa.View in 'src\tarefa\Tarefa.View.pas' {TarefaView},
  Formulario.Base in 'src\bases\view\Formulario.Base.pas' {FormularioBase},
  Faina.Cronograma.ExibicaoUnica.Frame in 'src\ferramentas\cronograma\Faina.Cronograma.ExibicaoUnica.Frame.pas' {frameCronogramaExibicaoUnica: TFrame},
  Faina.Calendario.Mes.Frame in 'src\ferramentas\calendario\Faina.Calendario.Mes.Frame.pas' {CalendarioMesFrame: TFrame},
  Faina.Calendario.Dia.Frame in 'src\ferramentas\calendario\Faina.Calendario.Dia.Frame.pas' {CalendarioDiaFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalView, PrincipalView);
  Application.Run;
end.
