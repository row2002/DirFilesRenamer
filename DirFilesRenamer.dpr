program DirFilesRenamer;

uses
  Forms,
  BaseUnit in 'BaseUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
