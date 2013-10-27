unit Ausgabe;

{$MODE Delphi}

interface

uses LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Easylase;

procedure Ausgabe_lpt;
procedure screenausgabe;
procedure ausgabe_bsw;
procedure Faderupdate;
function bin(innum: longint; places: byte): string;
function QueryPerformanceCount(aCount : Int64) : Boolean;

implementation
uses Lasersoftware, Image, Ausgabeeffekte
{$IFDEF LINUX}
 ,unixtype,Linux
{$ENDIF}
 ;

procedure Faderupdate;
var
  a: string;
begin
  // Fader V rot / H / V aktualisieren
  form1.sb8.position := StrToInt(form1.lb1.items[6]);
  form1.panel13.Caption := IntToStr(form1.sb8.position);
  form1.sb9.position := StrToInt(form1.lb1.items[7]);
  form1.panel14.Caption := IntToStr(form1.sb9.position);
  form1.sb6.position := StrToInt(form1.lb1.items[8]);
  form1.panel9.Caption := IntToStr(form1.sb6.position);

  //Checkboxen aktualisieren
  if copy(form1.lb1.items[4], 1, 1) = '1' then
    form1.cb3.Checked := True
  else
    form1.cb3.Checked := False;
  if copy(form1.lb1.items[4], 2, 1) = '1' then
    form1.cb4.Checked := True
  else
    form1.cb4.Checked := False;
  if copy(form1.lb1.items[4], 3, 1) = '1' then
    form1.cb5.Checked := True
  else
    form1.cb5.Checked := False;
  if copy(form1.lb1.items[4], 4, 1) = '1' then
    form1.cb33.Checked := True
  else
    form1.cb33.Checked := False;


  // BSW Bankswitchinfo ?
  a := copy(form1.lb1.items[9], 1, 3);
  if a <> '' then
  begin
    if a = '1' then
      form1.bs1.Checked := True;
    if a = '2' then
      form1.bs2.Checked := True;
    if a = '4' then
      form1.bs3.Checked := True;
    if a = '8' then
      form1.bs4.Checked := True;
    if a = '16' then
      form1.bs5.Checked := True;
    if a = '32' then
      form1.bs6.Checked := True;
    if a = '64' then
      form1.bs7.Checked := True;
    if a = '128' then
      form1.bs8.Checked := True;
    if a = '0' then
      form1.bs9.Checked := True;
  end
  else
    form1.bs9.Checked := True;


  // Wert für Pump
  form1.sb17.position := StrToInt(copy(form1.lb1.items[4], 11, 4));
  form1.panel33.Caption := IntToStr(form1.sb17.position);

  // Max. Drehwinkel
  form1.tb2.position := StrToInt(form1.lb1.items[10]);
  form1.panel51.Caption := IntToStr(form1.tb2.position);
  winkel1max := form1.tb2.position;
end;
// ENDE Faderupdate

// Ausgabe der Wiedergabe ins MAlfeld
procedure screenausgabe;
begin
  dcolor := port;
  if dcolor = 1 then
    form1.iOutput.canvas.pen.color := clbtnface;
  if dcolor = 2 then
    form1.iOutput.canvas.pen.color := clred;
  if dcolor = 4 then
    form1.iOutput.canvas.pen.color := clgreen;
  if dcolor = 8 then
    form1.iOutput.canvas.pen.color := clblue;
  if dcolor = 6 then
    form1.iOutput.canvas.pen.color := clyellow;
  if dcolor = 10 then
    form1.iOutput.canvas.pen.color := clpurple;
  if dcolor = 12 then
    form1.iOutput.canvas.pen.color := claqua;
  if dcolor = 14 then
    form1.iOutput.canvas.pen.color := clwhite;

  if punkte = 0 then
    form1.iOutput.canvas.moveto(xneu, yneu)
  else
    form1.iOutput.canvas.lineto(xneu, yneu);
end;


// Ausgabe an LPT und Bankschalter
procedure Ausgabe_LPT;
var
  z, i: integer;
  teil: string;
  StrPort: string;
begin
  if Status = 1 then
    Bc := 0;
  begin
    // Bildpunkte pro Zeile ermitteln für Schleife
    pprozeile := length(form1.lb1.items[bildnr + 20]) div 6;
    for z := 1 to pprozeile do
    begin
      if status = 0 then
        exit;
      application.ProcessMessages;
      Datenauslbholen;
      // Erster Punkt im Bild
      if z = 1 then
      begin
        QueryPerformanceCount(Zykpoint^);
        if prozzyklus >= TT_Mir_h then
          Winkelberechnenhor;
        if prozzyklus >= TT_Mir_v then
          Winkelberechnenver;

        if prozzyklus >= TT_rot then
        begin
          Winkel := winkel1 * (3.141592) / 90;
          Rotationsrichtung;
          TT_rot := prozzyklus + (form1.sb6.position * 5000);
          Drehwinkelumschaltung;
        end;
        if form1.sb17.position > 0 then
        begin
          if prozzyklus >= TT_Pump then
          begin
            if pumpdir = 0 then
              pumpmax := pumpmax + 2
            else
              pumpmax := pumpmax - 2;
            TT_pump := prozzyklus + (form1.sb17.position * 5000);
          end;

        end; // Ende Schleife "Z=1" 
      end;
      pumpen;
      rotieren;
      spiegeln;  // Routine für H + V Mirror, Winkelberechnun oben

      //Screenausgabe  ??
      //Jedes Bild ?
      if (form1.cb2.Checked = True) and (form1.cb6.Checked = True) then
      begin
        if z = 1 then
          image_loeschen_2;
        if (form1.cb2.Checked = True) then
          screenausgabe;
      end
      else
      // Nur neue Bilder
      if (form1.cb2.Checked = True) and (form1.cb6.Checked = False) and
        (Counter = 1) then
      begin
        if z = 1 then
        begin
          image_loeschen_2;
          counter := 1;
        end;
        if z <= pprozeile then
          screenausgabe;
        if Z = pprozeile then
          counter := 0;
      end;

      Invertoderswap;
      gain;

      //Begrenzung
      Zwangsblank := False;
      if ((Z = 1) and (Erster_Punkt_des_Bildes = True)) then
      begin
        Zwangsblank := False;
        Erster_Punkt_des_Bildes := False;
      end;
      begrenzung;
      if form1.cb37.Checked = True then
        invertbl;


      // Ausgabe normal oder beide PCBs ? ?
      if ((form1.cb38.Checked = False) and (LPTPort <> 999)) then
        ausgabeparallel;
      if ((form1.cb38.Checked = True) and (LPTPort <> 999)) then
        ausgabe_LPT_SS;

      // Für Blankrepeats diesen Punkt wiederholen
      if Port = 1 then
      begin
        for i := 0 to Blankrepeats do
        begin
          if ((form1.cb38.Checked = False) and (LPTPort <> 999)) then
            ausgabeparallel;
          if ((form1.cb38.Checked = True) and (LPTPort <> 999)) then
            ausgabe_LPT_SS;
        end;
      end;


      // Daten hier ins USB_Array schreiben;
      USB_X := xneu * 16;
      USB_Y := yneu * 16;
      USB_Port := port;
      USB_Daten[bc] := lo(USB_X);
      USB_Daten[BC + 1] := hi(USB_X);
      USB_Daten[bc + 2] := lo(USB_Y);
      USB_Daten[BC + 3] := hi(USB_Y);
      strport := Bin(port, 8);
      if copy(strPort, 7, 1) = '1' then
        USB_Daten[bc + 4] := 255
      else
        USB_Daten[bc + 4] := 0;
      if copy(strPort, 6, 1) = '1' then
        USB_Daten[bc + 5] := 255
      else
        USB_Daten[bc + 5] := 0;
      if copy(strPort, 5, 1) = '1' then
        USB_Daten[bc + 6] := 255
      else
        USB_Daten[bc + 6] := 0;
      if copy(strPort, 4, 1) = '1' then
        USB_Daten[bc + 7] := 255
      else
        USB_Daten[bc + 7] := 0;
      bc := bc + 8;

      // Für Blankrepeats diesen Punkt wiederholen
      if Port = 1 then
      begin
        for i := 0 to Blankrepeats do
        begin
          USB_Port := port;
          USB_Daten[bc] := lo(USB_X);
          USB_Daten[BC + 1] := hi(USB_X);
          USB_Daten[bc + 2] := lo(USB_Y);
          USB_Daten[BC + 3] := hi(USB_Y);
          strport := Bin(port, 8);
          if copy(strPort, 7, 1) = '1' then
            USB_Daten[bc + 4] := 255
          else
            USB_Daten[bc + 4] := 0;
          if copy(strPort, 6, 1) = '1' then
            USB_Daten[bc + 5] := 255
          else
            USB_Daten[bc + 5] := 0;
          if copy(strPort, 5, 1) = '1' then
            USB_Daten[bc + 6] := 255
          else
            USB_Daten[bc + 6] := 0;
          if copy(strPort, 4, 1) = '1' then
            USB_Daten[bc + 7] := 255
          else
            USB_Daten[bc + 7] := 0;
          bc := bc + 8;
        end;
      end;
      //---

      //Nächster Punkt
      punkte := punkte + 1;
      // Counter Outputspeed
      outputcounter := outputcounter + 1;
      // Wenn letzter Punkt, dann wieder von vorne
      // if copy(form1.lb1.items[bildnr+20],(punkte*6+1),2)=''then punkte:=0;

    end;// Schleife 1 Bild
    // Bild fertig berechnet für Ausgabe an USB
    Easylase_Writeframe;

    // Ende Ausgabe an USB
    Punkte := 0; // Ersetzt Zeile " if Copy (Form1 . . .)

    //Takt vom Bildumschalttimer ? ?
    if Bildumschalten = True then
    begin
      teil := '';
      teil := copy(form1.lb1.items[bildnr + 21], 1, 3);
      if teil <> '' then
      begin
        bildnr := bildnr + 1;
        Erster_Punkt_des_Bildes := True;
        punkte := 0;
        counter := 1;
        DLZaehler := 0;
      end
      else
      begin
        bildnr := 1;
        punkte := 0;
        counter := 1;
        DLZaehler := 0;
      end;
      Bildumschalten := False;
    end;
  end; // Ende Status=1 ist erfüllt
end;

procedure ausgabe_bsw;
begin
  Easylase_Write_TTL;
end;


// Function bin; UMWANDLUNG
function bin(innum: longint; places: byte): string;
var
  i: byte;
  hstr: string[16];
begin
  hstr[0] := chr(places);
  for i := places downto 1 do
  begin
    hstr[i] := chr($30 + (innum and $00000001));
    innum := innum shr 1;
  end;
  Bin := Hstr;
end;

function QueryPerformanceCount(aCount: Int64): Boolean;
{$IFDEF LINUX}
var
  aLoc : timespec;
const
  C_THOUSAND = 1000;
  C_MILLION  = C_THOUSAND * C_THOUSAND;
  C_BILLION  = C_THOUSAND * C_THOUSAND * C_THOUSAND;
{$ENDIF LINUX}
begin
  Result := True;
  {$IFDEF WINDOWS}
  QueryPerformanceCounter(aCount);
  {$ENDIF WINDOWS}
  {$IFDEF LINUX}
  clock_gettime(CLOCK_MONOTONIC,@aLoc);
  aCount := (aloc.tv_sec * C_BILLION) + aloc.tv_nsec;
  {$ENDIF LINUX}
end;


end.