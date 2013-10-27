unit Easylase;

{$MODE Delphi}

interface

uses LMessages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

procedure Easylase_angeschlossen;
procedure Easylase_Writeframe;
procedure Easylase_STOP;
procedure Easylase_Write_TTL;
procedure EasyLaseDoClose;
procedure DMX_Out;
function bin(innum: longint; places: byte): string;

{$IFDEF UWINDOWS}
function EasyLaseWriteTTL(var USB_CardNr: integer; USB_TTL: word): boolean; stdcall; external 'easylase.dll';
function EasyLaseGetCardNum(): integer; stdcall; external 'easylase.dll';
function EasyLaseGetStatus(var CardNumber: integer): integer; stdcall; external 'easylase.dll';
function EasyLaseClose(): boolean; stdcall; external 'easylase.dll';
function EasyLaseStop(var CardNumber: integer): boolean; stdcall;external 'easylase.dll';
function EasyLaseWriteFrame(var CardNumber: integer; DataBuffer: pointer; DataCounter: integer;Speed: word): boolean; stdcall;external 'easylase.dll';
function EasyLaseWriteDMX(var CardNumber: integer; DMXBuffer: pointer): boolean;stdcall; external 'easylase.dll';
// Ende USB
{$ENDIF}

implementation

uses lasersoftware;

procedure Easylase_angeschlossen;
begin
 {$IFDEF UWINDOWS}
  if (EasyLaseGetCardNum > 0) and (LPTPort = 999) then
  begin
    form1.panel8.color := clbtnface;
    USB_CardNR := 0;
  end
  else
  begin
    form1.panel8.color := clred;
    USB_CardNR := 99;
  end;
  {$ENDIF}
end;

procedure Easylase_Writeframe;
var
  i: integer;
  p: word;
begin
 {$IFDEF UWINDOWS}
  if EasyLaseGetStatus(USB_CardNr) <> 1 then
    Exit;
  if ((lptport = 999) and (form1.panel8.color = clbtnface)) then
  begin
    P := psw;

    USB_Totalpoints := bc;
    if EasyLaseGetStatus(USB_CardNr) = 1 then
    begin
      EasyLaseWriteFrame(USB_CardNr, @USB_DATEN, USB_Totalpoints, USB_Speed);
      EasyLaseWriteTTL(USB_CardNr, p);
      //Framesdraussen:=framesdraussen+1;
      //form1.panel52.caption:=inttostr(Framesdraussen);
    end;
  end;
  {$ENDIF}
end;

// Stopp
procedure EasyLase_Stop;
var
  a: integer;
begin
 {$IFDEF UWINDOWS}
  a := 0;
  USB_TTL := 0;
  EasylaseStop(a);
  EasyLaseWriteTTL(USB_CardNr, USB_TTL);
 {$ENDIF}
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

procedure Easylase_Write_TTL;
var
  p: word;
begin
 {$IFDEF UWINDOWS}
  p := psw;
  if easylasegetcardnum > 0 then
    EasyLaseWriteTTL(USB_CardNr, p);
 {$ENDIF}
end;

procedure EasyLaseDoClose;
begin
 {$IFDEF UWINDOWS}
 easylaseclose;
 {$ENDIF}
end;

procedure DMX_Out;
begin
 {$IFDEF UWINDOWS}
  EasyLaseWriteDMX(USB_CardNR, @DMX_Buffer);
 {$ENDIF}
end;


end.
