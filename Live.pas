unit Live;

{$MODE Delphi}

interface

uses LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, FileUtil;

procedure Live_update;
procedure panel_update;
procedure Live_Abruf;
procedure Bankschalter;
procedure RNDADJ;

implementation

uses Lasersoftware, Image, Ausgabe, Shortcuts;

procedure Live_update;
var
  ini, hauptverzeichnis: string;
begin
  getdir(0, hauptverzeichnis);
  ini := hauptverzeichnis + '\Live.ldt';

  if FileExistsUTF8(ini) { *Converted from FileExists* } then
  begin
    form1.memo3.Lines.loadfromfile(ini);
    panel_update;
    Faderupdate;
  end;

end;

// Geladene Tastaturbelegung anzeigen
procedure panel_update;
begin
  form1.panel17.Caption := ExtractFileName(form1.memo3.Lines[1]);
  form1.panel18.Caption := ExtractFileName(form1.memo3.Lines[2]);
  form1.panel19.Caption := ExtractFileName(form1.memo3.Lines[3]);
  form1.panel20.Caption := ExtractFileName(form1.memo3.Lines[4]);
  form1.panel21.Caption := ExtractFileName(form1.memo3.Lines[5]);
  form1.panel22.Caption := ExtractFileName(form1.memo3.Lines[6]);
  form1.panel23.Caption := ExtractFileName(form1.memo3.Lines[7]);
  form1.panel24.Caption := ExtractFileName(form1.memo3.Lines[8]);
  form1.panel25.Caption := ExtractFileName(form1.memo3.Lines[9]);
  form1.panel26.Caption := ExtractFileName(form1.memo3.Lines[10]);
  form1.panel35.Caption := ExtractFileName(form1.memo3.Lines[11]);
  form1.panel36.Caption := ExtractFileName(form1.memo3.Lines[12]);
  form1.panel37.Caption := ExtractFileName(form1.memo3.Lines[13]);
  form1.panel38.Caption := ExtractFileName(form1.memo3.Lines[14]);
  form1.panel39.Caption := ExtractFileName(form1.memo3.Lines[15]);
  form1.panel40.Caption := ExtractFileName(form1.memo3.Lines[16]);
  form1.panel41.Caption := ExtractFileName(form1.memo3.Lines[17]);
  form1.panel42.Caption := ExtractFileName(form1.memo3.Lines[18]);
  form1.panel43.Caption := ExtractFileName(form1.memo3.Lines[19]);
  form1.panel44.Caption := ExtractFileName(form1.memo3.Lines[20]);
  form1.panel45.Caption := ExtractFileName(form1.memo3.Lines[21]);
  form1.panel46.Caption := ExtractFileName(form1.memo3.Lines[22]);
  form1.panel47.Caption := ExtractFileName(form1.memo3.Lines[23]);
  form1.panel48.Caption := ExtractFileName(form1.memo3.Lines[24]);
  form1.panel49.Caption := ExtractFileName(form1.memo3.Lines[25]);
  form1.panel50.Caption := ExtractFileName(form1.memo3.Lines[26]);

end;

// Taste wurde gedrückt
procedure Live_Abruf;
var
  filename: string;
  a, sk: integer;
begin
  // Bankschalter ?? (Taste 1-8 )
  if (taste <= 56) and (Taste >= 48) then
    Bankschalter;
  if (taste = 114) or (taste = 33) or (Taste = 34) then
    RNDADJ;

  // Je nach Taste in Routine unter "Shortcuts" Springen
  if taste = 13 then
    start;
  if taste = 27 then
    stop;
  if taste = 113 then
    motfilespeichern;
  if taste = 116 then
    form1.button10.click; //Play
  if taste = 117 then
    form1.button15.click; // Cue -50
  if taste = 118 then
    form1.button14.click; // Cue +50
  if taste = 119 then
    form1.button16.click; // JMP Cue


  // Taste irgendeine der LIVE Abruf Tasten ?
  if (Taste >= 65) and (Taste <= 90) then
  begin
    if status = 1 then
    begin
      form1.pg2.SetFocus;
      Application.ProcessMessages;
      form1.bStop.click;
      a := 1;
      Application.ProcessMessages;
    end;
    repeat
      sleep(10)
    until status = 0;

    if taste = 81 then
      filename := form1.memo3.Lines[1];
    if taste = 87 then
      filename := form1.memo3.Lines[2];
    if taste = 69 then
      filename := form1.memo3.Lines[3];
    if taste = 82 then
      filename := form1.memo3.Lines[4];
    if taste = 84 then
      filename := form1.memo3.Lines[5];
    if taste = 90 then
      filename := form1.memo3.Lines[6];
    if taste = 85 then
      filename := form1.memo3.Lines[7];
    if taste = 73 then
      filename := form1.memo3.Lines[8];
    if taste = 79 then
      filename := form1.memo3.Lines[9];
    if taste = 80 then
      filename := form1.memo3.Lines[10];
    if taste = 65 then
      filename := form1.memo3.Lines[11];
    if taste = 83 then
      filename := form1.memo3.Lines[12];
    if taste = 68 then
      filename := form1.memo3.Lines[13];
    if taste = 70 then
      filename := form1.memo3.Lines[14];
    if taste = 71 then
      filename := form1.memo3.Lines[15];
    if taste = 72 then
      filename := form1.memo3.Lines[16];
    if taste = 74 then
      filename := form1.memo3.Lines[17];
    if taste = 75 then
      filename := form1.memo3.Lines[18];
    if taste = 76 then
      filename := form1.memo3.Lines[19];
    if taste = 89 then
      filename := form1.memo3.Lines[20];
    if taste = 88 then
      filename := form1.memo3.Lines[21];
    if taste = 67 then
      filename := form1.memo3.Lines[22];
    if taste = 86 then
      filename := form1.memo3.Lines[23];
    if taste = 66 then
      filename := form1.memo3.Lines[24];
    if taste = 78 then
      filename := form1.memo3.Lines[25];
    if taste = 77 then
      filename := form1.memo3.Lines[26];

    // File von Liveaufruf laden Wenn File da Namen da
    if FileExistsUTF8(filename) { *Converted from FileExists* } then
    begin
      winkel := 180;
      winkhor := 180;
      winkver := 180;
      winkel1 := 180;
      winkhor1 := 180;
      winkver1 := 180;
      form1.lb1.items.loadfromfile(filename);
      form1.lb1.refresh;
      form1.sb1.position := 1;
      punkte := 0;
      neuzeichnen;
      image_loeschen;
      redraw;
      faderupdate;
      form1.sb4.position := StrToInt(form1.lb1.items[5]);
      if a = 1 then
      begin
        form1.bStart.click;
        Application.ProcessMessages;
        a := 0;
        Application.ProcessMessages;
      end;
    end;
    // Ende File laden
  end; // Ende Live Abruf

end;


// Manueller Abruf der Bankschalter
procedure Bankschalter;
begin
  if taste = 49 then
    form1.bs1.Checked := True;
  if taste = 50 then
    form1.bs2.Checked := True;
  if taste = 51 then
    form1.bs3.Checked := True;
  if taste = 52 then
    form1.bs4.Checked := True;
  if taste = 53 then
    form1.bs5.Checked := True;
  if taste = 54 then
    form1.bs6.Checked := True;
  if taste = 55 then
    form1.bs7.Checked := True;
  if taste = 56 then
    form1.bs8.Checked := True;
  if taste = 48 then
    form1.bs9.Checked := True;
end;

// Random Adjust über Tastatur
procedure RNDADJ;
begin
  if Taste = 114 then
  begin
    if form1.cb13.Checked = False then
      form1.cb13.Checked := True
    else
      form1.cb13.Checked := False;
  end;
  if taste = 33 then
    form1.sb14.position := form1.sb14.position + 1;
  if taste = 34 then
    form1.sb14.position := form1.sb14.position - 1;

end;



end.