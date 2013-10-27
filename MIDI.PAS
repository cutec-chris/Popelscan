unit MIDI;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, QCCom32,Spin, MMSystem,ausgabe;

Procedure Taste_zuweisen;
implementation
uses lasersoftware;


Procedure Taste_zuweisen;
Begin
//Var tastennr ist die gefrückte Taste

// Nur die Weissen belegen
// neuerton:=db1-36;

case neuerton of
 36:tastennr:=0;
 38:tastennr:=1;
 40:tastennr:=2;
 41:tastennr:=3;
 43:tastennr:=4;
 45:tastennr:=5;
 47:tastennr:=6;
 48:tastennr:=7;
 50:tastennr:=8;
 52:tastennr:=9;
 53:tastennr:=10;
 55:tastennr:=11;
 57:tastennr:=12;
 59:tastennr:=13;
 60:tastennr:=14;
 62:tastennr:=15;
 64:tastennr:=16;
 65:tastennr:=17;
 67:tastennr:=18;
 69:tastennr:=19;
 71:tastennr:=20;
 72:tastennr:=21;
 74:tastennr:=22;
 76:tastennr:=23;
 77:tastennr:=24;
 79:tastennr:=25;
 81:tastennr:=26;
 83:tastennr:=27;
 84:tastennr:=28;
 86:tastennr:=29;
 88:tastennr:=30;
 89:tastennr:=31;
 91:tastennr:=32;
 93:tastennr:=33;
 95:tastennr:=34;
 96:tastennr:=35;

end;


End;








end.
