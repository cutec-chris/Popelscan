program Project1;

{$MODE Delphi}

uses
  Forms, Interfaces,
  Lasersoftware in 'Lasersoftware.pas' {Form1},
  Ausgabe in 'Ausgabe.pas',
  Image in 'Image.pas',
  Live in 'Live.pas',
  Shortcuts in 'Shortcuts.pas',
  Ausgabeeffekte in 'Ausgabeeffekte.pas',
  Easylase in 'Easylase.pas';

{.$R *.res}


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.