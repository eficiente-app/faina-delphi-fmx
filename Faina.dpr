program Faina;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal.View in 'src\principal\Principal.View.pas' {PrincipalView},
  Tarefa.View in 'src\tarefa\Tarefa.View.pas' {TarefaView},
  Formulario.Base in 'src\bases\view\Formulario.Base.pas' {FormularioBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalView, PrincipalView);
  Application.CreateForm(TFormularioBase, FormularioBase);
  Application.Run;
end.
