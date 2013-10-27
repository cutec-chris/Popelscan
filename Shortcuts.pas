unit Shortcuts;

{$MODE Delphi}

interface

uses
  LMessages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ausgabe;

procedure start;
procedure Stop;
procedure motfilespeichern;

implementation

uses lasersoftware, live;

procedure start;
begin
  faderupdate;
  status := 1;
  form1.bStart.click;
end;

procedure Stop;
begin
  status := 0;
  form1.bStop.click;
end;

procedure motfilespeichern;
begin
  form1.bStop.click;
  form1.Sequenzspeichern1.Click;
end;

end.