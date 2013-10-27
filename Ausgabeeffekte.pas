unit Ausgabeeffekte;

{$MODE Delphi}

interface

uses Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

procedure Rotationsrichtung;
procedure Drehwinkelumschaltung;
procedure Winkelberechnenhor;
procedure Winkelberechnenver;
procedure Datenauslbholen;
procedure rotieren;
procedure Spiegeln;
procedure Pumpen;
procedure Begrenzung;
procedure Begrenzung2;
procedure Begrenzung3;
procedure invertoderswap;
procedure gain;
procedure Ausgabeseriell;
procedure Ausgabeparallel;
procedure Blank_invert;
procedure invertbl;
procedure Ausgabe_128;
procedure Ausgabe_128_TTL;
procedure Ausgabe_lis;
procedure PCB_Reset;
procedure ausgabe_LPT_SS;
procedure ASMNOP;
procedure testausgabe;

implementation

uses Lasersoftware, image;

{$IFDEF WINDOWS}
procedure PortOut(Port: word; Data: byte); stdcall; external 'io.dll';
{$ELSE}
procedure PortOut(Port: word; Data: byte);
begin

end;

{$ENDIF}

procedure Rotationsrichtung;
var
  a: integer;
begin
  a := ((30 - form1.sb6.position) div 4) + 1;
  if form1.cb33.Checked = True then
  begin
    if winkel1d = 0 then
      winkel1 := winkel1 + a;
    if winkel1d = 1 then
      winkel1 := winkel1 - a;
  end;

  if form1.cb3.Checked = True then
  begin
    if winkel1d = 0 then
      winkel1 := winkel1 + a;
    if winkel1d = 1 then
      winkel1 := winkel1 - a;
  end;

end;

procedure Drehwinkelumschaltung;
begin
  if winkel1 >= winkel1max then
    winkel1d := 1;
  if winkel1 <= (0 - winkel1max) then
    winkel1d := 0;
  // Wenn Pos. 360 wirklich rotieren
  if form1.tb2.Position = 360 then
  begin
    if form1.cb3.Checked = True then
      winkel1d := 1;
    if form1.cb33.Checked = True then
      winkel1d := 0;
  end;

end;

procedure Winkelberechnenhor;
begin
  winkhor1 := winkhor1 + 2;
  winkhor := (winkhor1 * 3.141592) / 90;
  if winkhor1 > winkhormax then
    winkhor1 := 0;
  //TODO:QueryPerformancecounter(Zykpoint^);
  TT_Mir_h := prozzyklus + (form1.sb8.position * 5000);
  counter := 1;
end;

procedure Winkelberechnenver;
begin
  winkver1 := winkver1 + 2;
  winkver := (winkver1 * 3.141592) / 90;
  if winkver1 > winkvermax then
    winkver1 := 0;
  //TODO:QueryPerformancecounter(Zykpoint^);
  TT_Mir_v := prozzyklus + (form1.sb9.position * 5000);
  counter := 1;
end;

procedure Datenauslbholen;
var
  Teilstring: string;
begin
  Teilstring := copy(form1.lb1.items[bildnr + 20], (punkte * 6 + 1), 6);
  port := StrToInt('$' + copy(teilstring, 1, 2));
  xneu := StrToInt('$' + copy(teilstring, 3, 2));
  yneu := StrToInt('$' + copy(teilstring, 5, 2));
end;

procedure rotieren;
begin
  if (form1.cb3.Checked) or (form1.cb33.Checked) = True then
  begin
    xneu := 128 - xneu;
    yneu := 128 - yneu;
    xd := xneu;
    yd := yneu;
    xneu := 255 - round((xd * cos(winkel) - (yd * sin(winkel))) + 128);
    yneu := 255 - round((xd * sin(winkel) + (yd * cos(winkel))) + 128);

  end;

end;

procedure Spiegeln;
begin
  //Horizontal Spiegeln ?
  if form1.cb4.Checked = True then
  begin
    yneu := 128 - yneu;
    xd := xneu;
    Yd := yneu;
    yneu := round((yd * cos(winkhor) + (yd * sin(winkhor)) / 4) + 128);
  end;
  //vertikal Spiegeln ?
  if form1.cb5.Checked = True then
  begin
    xneu := 128 - xneu;
    xd := xneu;
    Yd := yneu;
    xneu := round((xd * cos(winkver) + (xd * sin(winkver)) / 4) + 128);
  end;

end;

procedure Pumpen;
begin
  if pumpmax <= 15 then
    Pumpdir := 0;
  if pumpmax >= 100 then
    Pumpdir := 1;

  if xneu < 128 then
  begin
    xneu := round(xneu + ((128 - xneu) * ((100 - pumpmax) / 100)));
  end
  else
  begin
    xneu := round(xneu - ((xneu - 128) * ((100 - pumpmax) / 100)));
  end;

  if yneu < 128 then
  begin
    yneu := round(yneu + ((128 - yneu) * ((100 - pumpmax) / 100)));
  end
  else
  begin
    yneu := round(yneu - ((yneu - 128) * ((100 - pumpmax) / 100)));
  end;
end;


procedure Begrenzung;
begin
  if xneu > 255 then
  begin
    xneu := 255;
  end;
  if yneu > 255 then
  begin
    yneu := 255;
  end;
  if xneu < 0 then
  begin
    xneu := 0;
  end;
  if yneu < 0 then
  begin
    yneu := 0;
  end;
end;
// Bei interpolation  überschwinger blanken

procedure Begrenzung2;
begin
  if xneu > 255 then
  begin
    xneu := 255;
  end;
  if yneu > 255 then
  begin
    yneu := 255;
  end;
  if xneu < 0 then
  begin
    xneu := 0;
  end;
  if yneu < 0 then
  begin
    yneu := 0;
  end;
end;

procedure Begrenzung3;
begin
  if xneu > 255 then
  begin
    xneu := 255;
    Zwangsblank := True;
  end;
  if yneu > 255 then
  begin
    yneu := 255;
    Zwangsblank := True;
  end;
  if xneu < 0 then
  begin
    xneu := 0;
    Zwangsblank := True;
  end;
  if yneu < 0 then
  begin
    yneu := 0;
    Zwangsblank := True;
  end;
end;

procedure Invertoderswap;
begin
  wegx := xneu;
  wegy := yneu;
  if form1.cb9.Checked = True then
    xneu := 255 - xneu;  // 1.9c
  if form1.cb10.Checked = True then
    yneu := 255 - yneu; // 1.9c
  if form1.cb11.Checked = True then
  begin
    wegx := xneu;
    wegy := yneu;
    xneu := round(wegy);
    yneu := round(wegx);
  end;

end;

procedure Gain;
begin
  if xneu < 128 then
  begin
    xneu := round(xneu + ((128 - xneu) * ((100 - form1.sb16.position) / 100)));
  end
  else
  begin
    xneu := round(xneu - ((xneu - 128) * ((100 - form1.sb16.position) / 100)));
  end;

  if yneu < 128 then
  begin
    yneu := round(yneu + ((128 - yneu) * ((100 - form1.sb16.position) / 100)));
  end
  else
  begin
    yneu := round(yneu - ((yneu - 128) * ((100 - form1.sb16.position) / 100)));
  end;

end;
// Ausgabe_Seriell macht nun 16 Bit ausgabe
procedure Ausgabeseriell;
begin
  // Ausgabe an Bankschalter   SERIELL
  if (status = 1) then
  begin
    portout(lptport, port);
    ASMNOP;
    portout(lptport, 5);
    ASMNOP;
    portout(lptport, 13);
    ASMNOP;

    portout(lptport, psw);
    ASMNOP;
    portout(lptport, 12);
    ASMNOP;
    portout(lptport, 13);
    ASMNOP;
  end;
end;


procedure Ausgabeparallel;
var
  p, i: integer;
begin
  if form1.cb14.Checked = True then
    if port = 1 then
    begin
      // Mit Blanking
      portout(lptport + 2, 5);
      ASMNOP;  //Alles sperren
      portout(lptport, xneu);
      ASMNOP; //Daten X
      portout(lptport + 2, 7);
      ASMNOP;  //Oben Daten rein
      portout(lptport + 2, 5);
      ASMNOP;  //Alles Sperren
      portout(lptport, yneu);
      ASMNOP; //Daten Y
      portout(lptport + 2, 1);
      ASMNOP;  //Alles raus
    end
    else
    begin
      // ohne Blanking
      portout(lptport + 2, 4);
      ASMNOP;  //Alles sperren
      portout(lptport, xneu);
      ASMNOP; //Daten X
      portout(lptport + 2, 6);
      ASMNOP;  //Oben Daten rein
      portout(lptport + 2, 4);
      ASMNOP;  //Alles Sperren
      portout(lptport, yneu);
      ASMNOP; //Daten Y
      portout(lptport + 2, 0);
      ASMNOP; //Alles raus
    end
  else
    portout(lptport + 2, 1);
  ASMNOP;// Ende enable Output}
  // Pause Neu
  if prozzyklusalt = 0 then
  begin
    //TODO:QueryPerformancecounter(Zykpoint^);
    prozzyklusalt := prozzyklus + Del_Time - (IDelta * 8);
  end;

  repeat
    //TODO:QueryPerformancecounter(Zykpoint^);
    application.ProcessMessages;
  until prozzyklus >= prozzyklusalt;

  prozzyklusalt := prozzyklus + Del_Time - (IDelta * 5);
end;



procedure Blank_invert;
begin
  if form1.cb38.Checked = False then
  begin
    if form1.cb37.Checked = True then
      portout(lptport + 2, 0)
    else
      portout(lptport + 2, 1);
  end
  else
  begin
    portout(lptport, 1);
    ASMNOP;
    portout(lptport + 2, 5);
    ASMNOP;
    portout(lptport + 2, 13);
    ASMNOP;
    portout(lptport, 0);
    ASMNOP;
    portout(lptport + 2, 8);
    ASMNOP;
    portout(lptport + 2, 13);
    ASMNOP;
  end;
end;

procedure Ausgabe_128;
begin
  if form1.cb38.Checked = False then
  begin
    portout(lptport + 2, 1);
    sleep(10); //Alles raus
    portout(lptport, 128);
    sleep(10);   //Daten X
    portout(lptport + 2, 7);
    sleep(10);  //Oben Daten rein
    portout(lptport + 2, 5);
    sleep(10);   //Alles Sperren
    portout(lptport, 128);
    sleep(10);   //Daten Y
    portout(lptport + 2, 1);
    sleep(10);   //Alles raus  }
    Blank_invert;
  end
  else
  begin
    portout(lptport + 2, 13);
    sleep(10);   //Alles raus
    portout(lptport, 128);
    sleep(10);  //Daten X
    portout(lptport + 2, 15);
    sleep(10);   //Oben Daten rein
    portout(lptport + 2, 13);
    sleep(10);   //Alles Sperren
    portout(lptport, 128);
    sleep(10);  //Daten Y
    portout(lptport + 2, 9);
    sleep(10);   //Alles raus  }
    Blank_invert;
  end;
end;

// Ausgabe auf 0 setzen mit ttl board
procedure Ausgabe_128_TTL;
var
  f: integer;
begin
  if Form1.cb37.Checked = False then
    f := 1
  else
    F := 254;
  //Strahlschalter updaten
  portout(lptport + 2, 13);
  ASMNOP;
  portout(lptport, f);
  ASMNOP;
  portout(lptport + 2, 5);
  ASMNOP;
  portout(lptport + 2, 13);
  ASMNOP;
  portout(lptport, psw);
  ASMNOP;
  portout(lptport + 2, 12);
  ASMNOP;
  portout(lptport + 2, 13);
  ASMNOP;

  // D/A Ausgabe
  portout(lptport + 2, 13);
  ASMNOP;  //Alles sperren
  portout(lptport, 128);
  ASMNOP;  //Daten X
  portout(lptport + 2, 15);
  ASMNOP; //Oben Daten rein
  portout(lptport + 2, 13);
  ASMNOP; //Alles Sperren
  portout(lptport, 128);
  ASMNOP; //Daten Y
  portout(lptport + 2, 9);
  ASMNOP;  //Alles raus

end;

procedure Ausgabe_lis;
begin
  application.ProcessMessages;
  portout(lptport + 2, 4 + laseran);
  ASMNOP;
  portout(lptport, xneu);
  ASMNOP;
  portout(lptport + 2, 6 + laseran);
  ASMNOP;
  portout(lptport + 2, 4 + laseran);
  ASMNOP;
  portout(lptport, yneu);
  ASMNOP;
  portout(lptport + 2, 0 + laseran);
  ASMNOP;
end;

// 16 Bit Hardware auf 0 setzen
procedure PCB_Reset;
var
  f: integer;
begin
  if Form1.cb37.Checked = False then
    f := 1
  else
    F := 254;
  // Farbport Pin 1 setzen
  portout(lptport, f);
  ASMNOP;
  portout(lptport + 2, 5);
  ASMNOP;
  portout(lptport + 2, 13);
  ASMNOP;
  // Alle Strahlschalter aus
  portout(lptport, 0);
  ASMNOP;
  portout(lptport + 2, 8);
  ASMNOP;
  portout(lptport + 2, 13);
  ASMNOP;

end;

// Ausgaberoutine DAC + Strahlschalter
procedure ausgabe_LPT_SS;
var
  p, i: integer;
begin
  // Ausgabe aktiv  ? ?
  if form1.cb14.Checked = True then
  begin
    //Strahlschalter updaten
    portout(lptport + 2, 13);   //13
    ASMNOP;
    portout(lptport, port);
    ASMNOP;
    portout(lptport + 2, 5);    //5
    ASMNOP;
    portout(lptport + 2, 13);    //13
    ASMNOP;
    portout(lptport, psw);
    ASMNOP;
    portout(lptport + 2, 12);  // war mal 12
    ASMNOP;



    // D/A Ausgabe
    portout(lptport + 2, 13);  //Alles sperren   13
    ASMNOP;
    portout(lptport, xneu); //Daten X
    ASMNOP;
    portout(lptport + 2, 15);  //Oben Daten rein 15
    ASMNOP;
    portout(lptport + 2, 13);  //Alles Sperren 13
    ASMNOP;
    portout(lptport, yneu); //Daten Y
    ASMNOP;
    portout(lptport + 2, 9); //Alles raus  9
    ASMNOP;

    // Pause Neu
    if prozzyklusalt = 0 then
    begin
      //TODO:QueryPerformancecounter(Zykpoint^);
      prozzyklusalt := prozzyklus + Del_Time - (IDelta * 8);
    end;

    repeat
      //TODO:QueryPerformancecounter(Zykpoint^);
      application.ProcessMessages;
    until prozzyklus >= prozzyklusalt;

    //TODO:QueryPerformancecounter(Zykpoint^);
    prozzyklusalt := prozzyklus + Del_Time - (IDelta * 5);

  end; // Ende Ausgabe
end;

procedure ASMNOP;
var
  a, b: integer;
begin
  for a := 1 to (form1.sb7.position * 1000) do
    b := b + 1;
end;

// Invert Blanking
procedure invertbl;
begin
  port := port xor 255;
end;

procedure testausgabe;
begin
  //form1.panel57.caption:=inttostr(form1.scrollbar1.position);
  //portout(lptport+2,form1.scrollbar1.position);
end;

end.