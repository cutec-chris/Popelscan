program Project1;

uses
  Forms,
  Lasersoftware in 'Lasersoftware.pas' {Form1},
  Ausgabe in 'Ausgabe.pas',
  Image in 'Image.pas',
  Live in 'Live.pas',
  Shortcuts in 'Shortcuts.pas',
  Ausgabeeffekte in 'Ausgabeeffekte.pas',
  Easylase in 'Easylase.pas';

{$R *.RES}


begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
