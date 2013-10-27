unit Lasersoftware;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Ausgabe, Image, Live, FileCtrl, BAIOPORT,
  ComCtrls, {OleCtrls, isp3, MPlayer,} DBCtrls, FileUtil,
  Ausgabeeffekte, Easylase,stopwatch;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    datei: TMenuItem;
    Sequenzladen1: TMenuItem;
    Sequenzspeichern1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    sb1: TScrollBar;
    Panel2: TPanel;
    Neu1: TMenuItem;
    Memo1: TMemo;
    Panel5: TPanel;
    Panel7: TPanel;
    bStart: TButton;
    bStop: TButton;
    GB2: TGroupBox;
    FileListBox1: TFileListBox;
    dlb1: TListBox;
    DriveComboBox1: TComboBox;
    N2: TMenuItem;
    DeletefromFilelist1: TMenuItem;
    PopupMenu1: TPopupMenu;
    menu: TMenuItem;
    Button3: TButton;
    LPTPort1: TMenuItem;
    H2781: TMenuItem;
    Hex3781: TMenuItem;
    Hex3BC1: TMenuItem;
    Panel8: TPanel;
    SaveSettings1: TMenuItem;
    Memo2: TMemo;
    Hilfe1: TMenuItem;
    Hilfe2: TMenuItem;
    Timer1: TTimer;
    Bankschalter: TMenuItem;
    Com11: TMenuItem;
    Com21: TMenuItem;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    sb2: TTrackBar;
    Panel3: TPanel;
    sb4: TTrackBar;
    sb3: TTrackBar;
    sb7: TTrackBar;
    sb8: TTrackBar;
    sb9: TTrackBar;
    sb6: TTrackBar;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel9: TPanel;
    pg2: TPageControl;
    banks: TTabSheet;
    GroupBox4: TGroupBox;
    bs1: TRadioButton;
    bs2: TRadioButton;
    bs3: TRadioButton;
    bs4: TRadioButton;
    bs5: TRadioButton;
    bs6: TRadioButton;
    bs7: TRadioButton;
    bs8: TRadioButton;
    Panel32: TPanel;
    Panel29: TPanel;
    sb16: TTrackBar;
    Label8: TLabel;
    Panel30: TPanel;
    sb17: TTrackBar;
    Label9: TLabel;
    Panel33: TPanel;
    cb14: TCheckBox;
    cb13: TCheckBox;
    sb14: TTrackBar;
    Panel27: TPanel;
    cb3: TCheckBox;
    cb4: TCheckBox;
    cb5: TCheckBox;
    cb9: TCheckBox;
    cb10: TCheckBox;
    cb11: TCheckBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    Button4: TButton;
    Button5: TButton;
    cb1: TCheckBox;
    cb2: TCheckBox;
    cb6: TCheckBox;
    GroupBox3: TGroupBox;
    rb5: TRadioButton;
    rb6: TRadioButton;
    rb7: TRadioButton;
    Label20: TLabel;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    cb12: TCheckBox;
    sb13: TTrackBar;
    sb12: TTrackBar;
    sb11: TTrackBar;
    sb10: TTrackBar;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    mp3: TTabSheet;
    Memo4: TMemo;
    Timer2: TTimer;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    tb1: TTrackBar;
    Panel31: TPanel;
    Panel34: TPanel;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    UpDown1: TUpDown;
    Timer3: TTimer;
    berPopelscan1: TMenuItem;
    UpDown2: TUpDown;
    Panel28: TPanel;
    cb31: TCheckBox;
    Shortcuts1: TMenuItem;
    live: TTabSheet;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel35: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Label42: TLabel;
    Label21: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label45: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Label37: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Panel49: TPanel;
    Panel48: TPanel;
    Panel47: TPanel;
    Panel46: TPanel;
    Panel45: TPanel;
    Label32: TLabel;
    Panel50: TPanel;
    Label22: TLabel;
    Panel36: TPanel;
    Memo3: TMemo;
    Button23: TButton;
    Button24: TButton;
    cb32: TCheckBox;
    Panel51: TPanel;
    Label31: TLabel;
    tb2: TTrackBar;
    cb33: TCheckBox;
    lb1: TDBListBox;
    cb34: TCheckBox;
    Button26: TButton;
    cb35: TCheckBox;
    Button27: TButton;
    bs9: TRadioButton;
    iOutput: TPaintBox;
    cb37: TCheckBox;
    midi: TTabSheet;
    ComboMidiIn: TComboBox;
    PanelMidiIn1: TPanel;
    PanelMidiIn2: TPanel;
    PanelMidiIn3: TPanel;
    PanelMidiInStatus: TPanel;
    PanelMidiInChannel: TPanel;
    PanelMidiInDB1: TPanel;
    PanelMidiInDB2: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Button25: TButton;
    Button28: TButton;
    Button29: TButton;
    Panel52: TPanel;
    Label54: TLabel;
    Timer4: TTimer;
    Timer5: TTimer;
    Panel53: TPanel;
    cb38: TCheckBox;
    Hex10001: TMenuItem;
    tb3: TTrackBar;
    Panel54: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    cb39: TCheckBox;
    rb8: TRadioButton;
    Panel55: TPanel;
    Label57: TLabel;
    rb9: TRadioButton;
    rb10: TRadioButton;
    rb11: TRadioButton;
    rb12: TRadioButton;
    rb13: TRadioButton;
    rb14: TRadioButton;
    lab: TLabel;
    Label3: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    midikeyoffset: TScrollBar;
    Panel56: TPanel;
    Label51: TLabel;
    EasyLaseUSB1: TMenuItem;
    Button30: TButton;
    Button31: TButton;
    procedure FormShow(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure sb1Change(Sender: TObject);
    procedure bStartClick(Sender: TObject);
    procedure Neu1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb2Change(Sender: TObject);
    procedure sb3Change(Sender: TObject);
    procedure iOutputMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure iOutputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Sequenzladen1Click(Sender: TObject);
    procedure Sequenzspeichern1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure sb4Change(Sender: TObject);
    procedure sb6Change(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure DeletefromFilelist1Click(Sender: TObject);
    procedure menuClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Hex3781Click(Sender: TObject);
    procedure H2781Click(Sender: TObject);
    procedure Hex3BC1Click(Sender: TObject);
    procedure sb7Change(Sender: TObject);
    procedure sb8Change(Sender: TObject);
    procedure sb9Change(Sender: TObject);
    procedure SaveSettings1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cb12Click(Sender: TObject);
    procedure sb11Change(Sender: TObject);
    procedure sb10Change(Sender: TObject);
    procedure sb12Change(Sender: TObject);
    procedure sb13Change(Sender: TObject);
    procedure rb5Click(Sender: TObject);
    procedure rb6Click(Sender: TObject);
    procedure rb7Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Hilfe2Click(Sender: TObject);
    procedure cb13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sb14Change(Sender: TObject);
    procedure bs1Click(Sender: TObject);
    procedure bs2Click(Sender: TObject);
    procedure bs3Click(Sender: TObject);
    procedure bs4Click(Sender: TObject);
    procedure bs5Click(Sender: TObject);
    procedure bs6Click(Sender: TObject);
    procedure bs7Click(Sender: TObject);
    procedure bs8Click(Sender: TObject);
    procedure Com11Click(Sender: TObject);
    procedure Com21Click(Sender: TObject);
    procedure pg2Change(Sender: TObject);


    procedure Panel9Click(Sender: TObject);
    procedure sb17Change(Sender: TObject);
    procedure dlb1Change(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure tb1Change(Sender: TObject);
    procedure Play(Sender: TObject);
    procedure cb14Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Panel32Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure berPopelscan1Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure cb31Click(Sender: TObject);
    procedure Shortcuts1Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure tb2Change(Sender: TObject);
    procedure cb3Click(Sender: TObject);
    procedure cb33Click(Sender: TObject);
    procedure cb34Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure cb35Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure bs9Click(Sender: TObject);
    procedure iOutputPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboMidiInChange(Sender: TObject);
    procedure midiShow(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure sb16Change(Sender: TObject);
    procedure cb38Click(Sender: TObject);
    procedure Hex10001Click(Sender: TObject);
    procedure tb3Change(Sender: TObject);
    procedure rb8Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure rb9Click(Sender: TObject);
    procedure rb10Click(Sender: TObject);
    procedure rb11Click(Sender: TObject);
    procedure rb12Click(Sender: TObject);
    procedure rb13Click(Sender: TObject);
    procedure rb14Click(Sender: TObject);
    procedure cb37Click(Sender: TObject);
    procedure midikeyoffsetChange(Sender: TObject);
    procedure EasyLaseUSB1Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
  private
    FStopWatch: TStopWatch;
    procedure GetMidiInDevs;
  protected
    //procedure MMMIMDATA (var message : TMessage); message MM_MIM_DATA;
    //TODO: MIDI Support
  public
    procedure UpdateMidiIn(statusm, db1, db2: DWord);
    property StopWatch : TStopWatch read FStopWatch;
  end;
// USB
     {$IFDEF WINDOWS}
function EasyLaseWriteTTL(var USB_CardNr: integer; USB_TTL: word): boolean;
  stdcall; external 'Easylase.dll';

function EasyLaseGetCardNum(): integer; stdcall; external 'Easylase.dll';
function EasyLaseGetStatus(var CardNumber: integer): integer;
  stdcall; external 'Easylase.dll';
function EasyLaseClose(): boolean; stdcall; external 'easylase.dll';
function EasyLaseStop(var CardNumber: integer): boolean; stdcall;
  external 'easylase.dll';
function EasyLaseWriteFrame
  (var CardNumber: integer; DataBuffer: pointer; DataCounter: integer;
  Speed: word): boolean; stdcall;
  external 'easylase.dll';
function EasyLaseWriteDMX(var CardNumber: integer; DMXBuffer: pointer): boolean;
  stdcall; external 'easylase.dll';
// Ende USB
     {$ENDIF}
function IntToBin(z: integer): string;
function GetNibble(nr, z: integer): integer;
procedure GetStrings(statusm: integer; var s1, s2, s3: string);

var
  Form1: TForm1;

var
  punkte, bildpunkte: integer;
  pprozeile: integer;
  Speed, Blankrepeats, blank: integer;
  xneu, yneu, xd, yd, linie: integer;
  xalt, yalt: real;
  port: integer;
  Zwangsblank: boolean;
  eckpunkte: byte;
  status, bildnr: integer;
  winkel1, winkhor1, winkver1, bende: integer;
  winkel, winkhor, winkver: real;
  wegx, wegy: real;
  counter: integer;
  lastcolor: integer;
  Erster_Punkt_des_Bildes: boolean;
  dcolor: integer;
  hauptverzeichnis: string;
  lptport, lptporth: integer;
  xkorp, xkorm, ykorp, ykorm: integer;
  bild: tbitmap;
  raster: integer;
  Live_File: string;
  Taste: integer;
  zufall: integer;
  psw: integer;
  laseran: integer;

  porto, pswo, smto: integer;
  pump, pumpdir, pumpmax: integer;
  Linienzahl, lastpos, alteposition: integer;
  cuepos, plinie, pstatus, zindex, lastsetpos, endelied, selfchange: integer;
  zindexlinie: integer;
  pfile: string;
  Bildda: integer;
  bildfile: string;
  outputcounter: longint;
  winkel1max, winkhormax, winkvermax: integer;
  winkel1d, winkhord, winkverd, wfix: integer;
  Durchlaeufe, DLZaehler: integer;
  Bildumschalten: boolean;
  // Für MIDI
  Alterton, neuerton, Tastennr: word;
  Loadfile: boolean;
  keyoffset: integer;
  // Neu Drawmode
  drawmode: string;
  crstart: boolean;
  centerx, centery: integer;
  radx, rady: integer;
  // Pause
  ASMNOPwert: integer;

  // Für Timing per Performance Counter
  // Pausenzeiten für DAC
  Pause: integer;
  Delay_pps: word;
  Delay_Time: real;
  Del_Time: int64;

  // Performancetiming
  Zykpoint: PInt64;
  prozfreq: int64;
  prozzyklus: int64;
  prozzyklusalt: int64;
  iCounttime: int64;
  iDelta: int64;

  TT_Mir_h: int64;
  TT_Mir_v: int64;
  TT_rot: int64;
  TT_pump: int64;

  //USB
  USB_Totalpoints: integer;
  USB_Speed: word;
  USB_CardNR: integer;
  USB_Daten: array[0..9999] of byte;
  USB_X, USB_Y: word;
  USB_port: byte;
  bc: word;
  fc: integer;
  Framesdraussen: word;
  USB_TTL: word;
  DMX_Buffer: array[0..511] of byte;


// MIDI
type
  TEvent = record
    statusm, db1, db2: DWord;
  end;

  TFilter = record
    channel, transpose, velocity: DWord;
  end;

var
  MidiInOpened: boolean;
  MidiInHandle: integer;
  MidiEvent: TEvent;
  Filter: TFilter;

// MIDI END


implementation

{$R *.lfm}
function IntToBin(z: integer): string;
var
  I: integer;
  s: string;
begin
  s := '';
  for I := 0 to 7 do
  begin
    if (z and (1 shl I)) <> 0 then
      s := '1' + s
    else
      s := '0' + s;
  end;
  Result := s;
end;

function GetNibble(nr, z: integer): integer;
begin
  Result := -1;
  case nr of
    0: Result := z and $F;
    1: Result := z and $F0;
  end;
end;


procedure TForm1.GetMidiInDevs;
var
  devs: integer;
  I: integer;
  //Caps : TMidiInCaps;
begin
  {
  if not MidiInOpened then exit;
  ComboMidiIn.Clear;
  devs := midiInGetNumDevs;
  for I := 0 to devs - 1 do
  begin
    midiInGetDevCaps (I, @Caps, sizeof (Caps));
    ComboMidiIn.Items.Add (Caps.szPname);
  end;
  ComboMidiIn.ItemIndex := 0;
  }
end;

{
procedure TForm1.MMMIMDATA (var message : TMessage);
var
  stat   : integer;
  d1, d2 : integer;
begin
  stat := message.lparam and $FF;
  if (stat >= $F0) then
  begin
    inherited;
    exit;
  end;
  d1 := (message.lparam shr 8) and $FF;
  d2 := (message.lparam shr 16) and $FF;
  UpdateMidiIn (stat, d1, d2);
  inherited;
end;
}
procedure TForm1.UpdateMidiIn(statusm, db1, db2: DWord);
var
  s1, s2, s3, filenamen: string;
begin
  PanelMidiIn1.Caption := IntToBin(statusm);
  PanelMidiIn2.Caption := IntToBin(db1);
  PanelMidiIn3.Caption := IntToBin(db2);
  GetStrings(statusm, s1, s2, s3);
  if statusm < 248 then
  begin
    PanelMidiInStatus.Caption := s1 + IntToStr(GetNibble(1, statusm));
    PanelMidiInChannel.Caption := 'Channel: ' + IntToStr(GetNibble(0, statusm));
  end
  else
  begin
    PanelMidiInStatus.Caption := s1 + IntToStr(statusm);
    PanelMidiInChannel.Caption := '---';
  end;
  if s2 <> '' then
  begin
    PanelMidiInDB1.Caption := s2 + IntToStr(db1);

    //Hier Abfrage ob neuer Tom
    if loadfile = False then
      repeat
        application.ProcessMessages
      until loadfile = True;
    loadfile := False;
    neuerton := db1;
    s2 := s2;
    if ((neuerton <> alterton) and (s2 = 'Tonnummer: ')) then
    begin
      s2 := '';
      tastennr := neuerton - keyoffset;
      if (filelistbox1.items.Count > tastennr) then
      begin
        filenamen := filelistbox1.Items[tastennr];
        //TODO:filenamen:=dlb1.Directory+'\'+filenamen;
        alterton := neuerton;

        if FileExistsUTF8(filenamen) { *Converted from FileExists* } then
        begin
          //TODO:midiInStop (MidiInHandle);
          //midiInReset (MidiInHandle);
          bStop.click;
          FileListBox1.Enabled := False;
          alterton := neuerton;
          winkel := 180;
          winkhor := 180;
          winkver := 180;
          winkel1 := 180;
          winkhor1 := 180;
          winkver1 := 180;
          form1.lb1.items.loadfromfile(filenamen);
          form1.sb1.position := 1;
          punkte := 0;
          neuzeichnen;
          image_loeschen;
          redraw;
          faderupdate;
          form1.sb4.position := StrToInt(form1.lb1.items[5]);
          //TODO:midiInReset (MidiInHandle);
          //midiInStart (MidiInHandle);
          FileListBox1.Enabled := True;
          bStart.click;
        end;
      end;
    end;
  end
  else
    PanelMidiInDB1.Caption := '---';
  if s3 <> '' then
    PanelMidiInDB2.Caption := s3 + IntToStr(db2)
  else
    PanelMidiInDB2.Caption := '---';

end;




// Programmstart
procedure TForm1.FormCreate(Sender: TObject);
var
  a: integer;
  ini, b: string;
  d: char;
var
  I: integer;
  s: string;
  // Perf. Counter
  iFreq: int64;
  iCountStart: int64;
  iCountEnd: int64;
  iCountPerSec: int64;
begin
  // Variablen
  eckpunkte := 2;
  lptport := 956;
  lptporth := 958;
  loadfile := True;
  keyoffset := 36;
  speed := 1;
  ASMNOPwert := 0;
  Blankrepeats := 0;
  Blank := 0;
  Punkte := 0;
  bildpunkte := 0;
  linie := 20;
  winkel := 10;
  winkhor := 1;
  winkver := 1;
  rb2.Checked := True;
  lastcolor := 2;
  dcolor := 2;
  port := 2;
  xkorm := 100;
  xkorp := 100;
  raster := 16;
  zufall := 0;
  pump := 0;
  pumpdir := 0;
  Linienzahl := 0;
  sb16.position := 0;
  bildda := 0;
  bildfile := '';
  winkel1max := 360;
  winkel1d := 0;
  winkhormax := 360;
  winkhord := 0;
  winkvermax := 360;
  winkverd := 0;
  Bildumschalten := False;
  drawmode := 'lines';
  wfix := 0;
  bildnr := 0;
  alterton := 0;

  // Memos initalisieren

  // LB
  for a := 1 to 5000 do
    lb1.items.add('');
  memo2.Lines.Clear;
  for a := 1 to 70 do
    memo2.Lines.add(' ');
  memo3.Lines.Clear;
  memo3.Lines.add('Live Settings');
  memo4.Lines.Clear;
  for a := 1 to 2000 do
    memo4.Lines.add(' ');
  // Image initalisieren
  bild := tbitmap.Create;
  image_loeschen;



  getdir(0, hauptverzeichnis);
  ini := hauptverzeichnis + '\ini.dat';
  //TODO:dlb1.Drive:='C'; dlb1.directory:='C:\';

  // Settings laden
  if FileExistsUTF8(ini) { *Converted from FileExists* } then
  begin
    // Start INI

    memo2.Lines.loadfromfile(ini);
    lptport := StrToInt(memo2.Lines[1]);
    lptporth := lptport + 2;
    panel8.Caption := 'Port:=' + memo2.Lines[1];
    if lptport = 999 then
    begin
      panel8.Caption := 'USB EasyLase';
      Easylase_angeschlossen;
      USB_CardNR := 0;
    end;
    sb7.position := StrToInt(memo2.Lines[3]);
    panel10.Caption := IntToStr(sb7.position);
    d := 'c';
    if copy(memo2.Lines[5], 1, 1) = 'c' then
      d := 'c';
    if copy(memo2.Lines[5], 1, 1) = 'd' then
      d := 'd';
    if copy(memo2.Lines[5], 1, 1) = 'e' then
      d := 'e';
    //TODO:drivecombobox1.drive:=d;
    //TODO:dlb1.directory:=memo2.lines[7];
    sb2.position := StrToInt(memo2.Lines[9]);
    panel3.Caption := IntToStr(sb2.position);
    sb3.position := StrToInt(memo2.Lines[11]);
    panel4.Caption := IntToStr(sb3.position);
    sb8.position := StrToInt(memo2.Lines[13]);
    panel13.Caption := IntToStr(sb8.position);
    sb9.position := StrToInt(memo2.Lines[15]);
    panel14.Caption := IntToStr(sb9.position);
    sb6.position := StrToInt(memo2.Lines[17]);
    panel9.Caption := IntToStr(sb6.position);
    sb7.position := StrToInt(memo2.Lines[19]);
    panel10.Caption := IntToStr(sb7.position);
    sb16.position := StrToInt(memo2.Lines[21]);
    panel30.Caption := IntToStr(sb16.position);
    pumpmax := sb16.position;
    if copy(memo2.Lines[23], 1, 1) = '1' then
      cb9.Checked := True;
    if copy(memo2.Lines[25], 1, 1) = '1' then
      cb10.Checked := True;
    if copy(memo2.Lines[27], 1, 1) = '1' then
      cb11.Checked := True;
    if copy(memo2.Lines[31], 1, 1) = '1' then
      cb37.Checked := True;
    if copy(memo2.Lines[33], 1, 1) = '1' then
      cb38.Checked := True;
    if copy(memo2.Lines[35], 1, 1) = '1' then
      cb35.Checked := True;

    // Actibe page
    if copy(memo2.Lines[37], 1, 1) = '1' then
      pg2.ActivePage := banks;
    if copy(memo2.Lines[37], 1, 1) = '2' then
      pg2.ActivePage := mp3;
    if copy(memo2.Lines[37], 1, 1) = '3' then
      pg2.ActivePage := live;
    if copy(memo2.Lines[37], 1, 1) = '4' then
      pg2.ActivePage := midi;
    if copy(memo2.Lines[37], 1, 1) = '' then
      pg2.ActivePage := mp3;

    // Interpolate Lines
    if copy(memo2.Lines[39], 1, 1) = '1' then
      cb39.Checked := True;
     {TODO:
     if memo2.lines[29] <> '' then
     begin
       com.port:=strtoint(memo2.lines[29]);
       if com.port=1 then
       begin
        com11.checked:=true;

       end;
       if com.port=2 then
        begin
         com21.checked:=true;

        end;
     end;
     com.close;com.open; com.Baud:=9600; com.showerrors:=false;
     com.responsetime:=300;
     }

    // - - - Ende seriell - - - -

    // Hilfedatei vorhanden ?
    b := hauptverzeichnis + '\hilfe.html';
    if FileExistsUTF8(b) { *Converted from FileExists* } then
      hilfe2.Enabled := True;

    // Namen der Bankschalter laden
    bs9.Caption := memo2.Lines[55];
    bs1.Caption := memo2.Lines[56];
    bs2.Caption := memo2.Lines[57];
    bs3.Caption := memo2.Lines[58];
    bs4.Caption := memo2.Lines[59];
    bs5.Caption := memo2.Lines[60];
    bs6.Caption := memo2.Lines[61];
    bs7.Caption := memo2.Lines[62];
    bs8.Caption := memo2.Lines[63];



    // Ende Werte aus Ini Ziehen
  end
  // Falls keine ini da, SMT Positionen erstellen
  else
  begin
    // Werte erstellen
    memo2.Lines[35] := 'SMT werte Z1';
    memo2.Lines[36] := '2';
    memo2.Lines[37] := '3';
    memo2.Lines[38] := '4';
    memo2.Lines[39] := '5';
    memo2.Lines[40] := '6';
    memo2.Lines[41] := '7';
    memo2.Lines[42] := '8';
    memo2.Lines[43] := '9';
    memo2.Lines[44] := '10';
    memo2.Lines[45] := '11';
    memo2.Lines[46] := '12';
    memo2.Lines[47] := '13';
    memo2.Lines[48] := '14';
    memo2.Lines[49] := '15';
    memo2.Lines[50] := '16';
    memo2.Lines[51] := '17';
    memo2.Lines[52] := '18';
    memo2.Lines[53] := '19';
    memo2.Lines[54] := '20';

    // Namen für Schalter
    memo2.Lines[55] := 'None';
    memo2.Lines[56] := 'BS 1';
    memo2.Lines[57] := 'BS 2';
    memo2.Lines[58] := 'BS 3';
    memo2.Lines[59] := 'BS 4';
    memo2.Lines[60] := 'BS 5';
    memo2.Lines[61] := 'BS 6';
    memo2.Lines[62] := 'BS 7';
    memo2.Lines[63] := 'BS 8';

    //Wert für SB16 Gain
    memo2.Lines[21] := '80';
    sb16.position := 80;

  end;
  image_loeschen;
  application.ProcessMessages;
  image_loeschen;
  application.ProcessMessages;

  // Blanking beim Programmstart
  Blank_invert;


  // Für MIDI
  PanelMidiInStatus.Caption := '';
  PanelMidiInChannel.Caption := '';
  PanelMidiInDB1.Caption := '';
  PanelMidiInDB2.Caption := '';

  fillchar(MidiEvent, sizeof(MidiEvent), 0);
  for I := 0 to 16 do
  begin
    if I = 0 then
      s := 'kein'
    else
      s := IntToStr(I - 1);
  end;
  for I := -24 to 24 do
  begin
    s := IntToStr(I);
  end;

  //  16 Bit Hardware auf 0 setzen
  if cb38.Checked = True then
    PCB_reset;

  // Default Tastaturbelegung laden
  //getdir(0,hauptverzeichnis);
  ini := hauptverzeichnis + '\default.ldt';
  opendialog1.filterindex := 3;
  if FileExistsUTF8(ini) { *Converted from FileExists* } then
  begin
    memo3.Lines.loadfromfile(ini);
    panel_update;
  end;
  bStop.click;

  Zykpoint := @prozzyklus;
  FStopWatch := TStopWatch.Create;
  // Aufwand für den Aufruf ermitteln, #
  // um die Präzision zu erhöhen
  FStopWatch.Start();
  FStopWatch.Stop();
  iDelta := FStopWatch.ElapsedTicks;
  FStopWatch.Reset();
  FStopWatch.Start();
  while true do
    begin
      FStopWatch.Stop();
      if FStopWatch.ElapsedMilliseconds>=1000 then
        begin
          iCountPerSec := FStopWatch.ElapsedTicks;
          break;
        end;
      FStopWatch.Start();
    end;
  // Timingvariable
  iCounttime:=iCountPerSec;
  //ICounttime = Clicks per sec
  FStopWatch.Reset();
  QueryPerformanceCount(Zykpoint^);
  Delay_pps:=sb2.position*10;
  Delay_Time:=Icounttime / Delay_PPS;
  Del_Time:=Round(Delay_Time);
end;

// Menue "Neue Datei"
procedure TForm1.Neu1Click(Sender: TObject);
var
  a: integer;
begin
  image_loeschen;
  punkte := 0;
  linie := 20;
  port := 2;
  rb2.Checked := True;
  psw := 1;
  bs9.Checked := True;
  lb1.Clear;
  for a := 1 to 150 do
    lb1.items.add('');
  panel29.Caption := '0';
  bildda := 0;
  bildfile := '';
  tb2.position := 360;
  panel51.Caption := '360';
  sb3.position := 0;
  panel4.Caption := '0';
  cb34.Checked := False;
  sb1.position := 0;
end;

// Laden
procedure TForm1.Sequenzladen1Click(Sender: TObject);
begin
  opendialog1.filterindex := 1;
  bStop.click;
  if opendialog1.Execute then
    if FileExistsUTF8(opendialog1.filename) { *Converted from FileExists* } then
    begin
      lb1.items.loadfromfile(opendialog1.filename);
      punkte := 0;
      sb1.position := 1;
      linie := 20;
      neuzeichnen;
      image_loeschen;
      redraw;
      sb4.position := StrToInt(lb1.items[5]);
      Faderupdate;
    end
    else
      MessageDlg('File nicht vorhanden', mtInformation, [mbOK], 0);
end;

// Speichern
procedure TForm1.Sequenzspeichern1Click(Sender: TObject);
var
  cb, Z, ZZ: string;
begin
  savedialog1.filterindex := 1;
  cb := '';
  // Speed und Blankdelay
  lb1.items[0] := IntToStr(sb2.position); // Point Delay  ja
  lb1.items[1] := IntToStr(sb3.position); // Blank Delay  nein
  // Anzahl der Punkte,  Bilderfadermax;
  lb1.items[2] := IntToStr(punkte);    // Anzahl der Punkte Bild1  ??
  lb1.items[3] := IntToStr(sb1.max);   // Bildfader
  //Checkboxen
  if cb3.Checked = True then
    cb := cb + '1'
  else
    cb := cb + '0';  // Rot left
  if cb4.Checked = True then
    cb := cb + '1'
  else
    cb := cb + '0';  // Hor Mirror
  if cb5.Checked = True then
    cb := cb + '1'
  else
    cb := cb + '0';  // Vert Mirror
  if cb33.Checked = True then
    cb := cb + '1'
  else
    cb := cb + '0'; // Rot right
  //  Platzhalter für weitere Checkboxen
  cb := cb + '000000';
  lb1.items[4] := cb; // Bitreihe der Checkboxen
  // Pumpen
  z := IntToStr(sb17.position);
  zz := lb1.items[4];
  lb1.items[4] := zz + ' ' + z;  // Punpwert hinter den Checkboxen
  // Bild Delay
  lb1.items[5] := IntToStr(sb4.position);  // Fader Pic-Delay
  // Faderwerte rot / H / V
  lb1.items[6] := IntToStr(sb8.position);   // Hor
  lb1.items[7] := IntToStr(sb9.position);   // Vert
  lb1.items[8] := IntToStr(sb6.position);   // Rot
  //Bankschalter
  lb1.Items[9] := IntToStr(psw); // Bankschalter
  // Max. Drehwinkel
  lb1.items[10] := IntToStr(tb2.position);  // Drehwinkelbegrenzung

  lb1.items[11] := '1';
  lb1.items[12] := '1';
  lb1.items[13] := '1';
  lb1.items[14] := '1';
  lb1.items[15] := '1';
  lb1.items[16] := '1';
  lb1.items[17] := '1';
  lb1.items[18] := '1';
  lb1.items[19] := '1';     // Füller für WAS AUCH IMMER

  bStop.click;

  savedialog1.filterindex := 1;
  savedialog1.filename := filelistbox1.filename;
  if savedialog1.Execute then
    if FileExistsUTF8(savedialog1.filename) { *Converted from FileExists* } then
    begin
      if MessageDlg('File Exist' + #13#10 + #13#10 + 'Overwrite ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        lb1.items.savetofile(savedialog1.filename);
        filelistbox1.update;
      end
      else
        exit;
    end;

  lb1.items.savetofile(savedialog1.filename);
  filelistbox1.update;
end;
// ENDE Motfile Speichern

// Löschen aus Fileliste
procedure TForm1.menuClick(Sender: TObject);
var
  filename: string;
begin
  filename := filelistbox1.filename;
  if FileExistsUTF8(FileName) { *Converted from FileExists* } then

    if MessageDlg('Are you sure you want to delete this File ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DeleteFileUTF8(FileName);
  { *Converted from DeleteFile* }filelistbox1.update;
end;

// 3 x LPT Adresse wählen
procedure TForm1.Hex3781Click(Sender: TObject);
begin
  lptport := 888;
  panel8.Caption := 'Port=888';
end;

procedure TForm1.H2781Click(Sender: TObject);
begin
  lptport := 632;
  panel8.Caption := 'Port=632';
end;

procedure TForm1.Hex3BC1Click(Sender: TObject);
begin
  lptport := 956;
  panel8.Caption := 'Port=956';
end;

procedure TForm1.EasyLaseUSB1Click(Sender: TObject);
begin
  lptport := 999;
  panel8.Caption := 'USB EasyLase';
end;

// Beenden
procedure TForm1.Beenden1Click(Sender: TObject);
begin
  cb12.Checked := False;
  status := 0;
  bStop.click;
  //TODO:com.close;
  form1.Close;
end;

// Bildumschaltung
procedure TForm1.sb1Change(Sender: TObject);
var
  a: integer;
begin
  label1.Caption := 'Bild Nr. ' + IntToStr(sb1.position);
  if status = 0 then
    image_loeschen
  else
    image_loeschen_2;
  a := length(lb1.items[form1.sb1.position + 20]);
  panel29.Caption := IntToStr(round(a / 6));
  punkte := 0;
  rb2.Checked := True;
  if status = 0 then
    redraw;
  punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);
end;

//  Scrollbar P-Delay
procedure TForm1.sb2Change(Sender: TObject);
begin
  application.ProcessMessages;
  speed := sb2.position;
  panel3.Caption := IntToStr(sb2.position);
  // Performance timing
  Delay_pps := sb2.position * 10;
  USB_Speed := sb2.position * 10;
  Delay_Time := Icounttime / Delay_PPS;
  Del_Time := Round(Delay_Time);

end;

// Scrollbar B-Delay
procedure TForm1.sb3Change(Sender: TObject);
begin
  blankrepeats := sb3.position;
  panel4.Caption := IntToStr(sb3.position);
end;

// Scrollbar Bild - Delay
procedure TForm1.sb4Change(Sender: TObject);
begin
  panel6.Caption := IntToStr(sb4.position);
  timer5.interval := 100 * sb4.position;
  punkte := 0;
end;

// Scrollbar Rotationsgeschwindigkeit Z-Achse
procedure TForm1.sb6Change(Sender: TObject);
begin
  panel9.Caption := IntToStr(sb6.position);
  panel9.refresh;
end;

// Scrollbar M-Delay Multiplikator für P-Delay
procedure TForm1.sb7Change(Sender: TObject);
begin
  panel10.Caption := IntToStr(sb7.position);
  ASMNOPwert := sb7.position * 100;
end;

// Scrollbar Vertikale Rotationsgeschwindigkeit
procedure TForm1.sb8Change(Sender: TObject);
begin
  panel13.Caption := IntToStr(sb8.position);
end;

// Scrollbar Horizontale Rotationsgeschwindigkeit
procedure TForm1.sb9Change(Sender: TObject);
begin
  panel14.Caption := IntToStr(sb9.position);
end;


// Button "Start Ausgabe"
procedure TForm1.bStartClick(Sender: TObject);
begin
  // Outputspeed
  USB_Speed := sb2.position * 10;
  Framesdraussen := 0;
  loadfile := True;
  cb34.Checked := False;
  prozzyklusalt := 0;
  outputcounter := 0;
  Erster_Punkt_des_Bildes := True;
  if lptport <> 999 then
    timer4.Enabled := True; // pps Anzeit
  if sb3.position = 0 then
    timer5.Enabled := False;
  bStart.Enabled := False;
  bStop.Enabled := True;
  porto := 0;
  winkel1 := 0;
  DLZaehler := 0;
  sb1.position := 1;
  punkte := 0;
  pumpmax := 100;
  bildnr := 1;
  counter := 1;
  bildumschalten := False;
  cb34.Checked := False;
  datei.Enabled := False;
  berpopelscan1.Enabled := False;
  shortcuts1.Enabled := False;
  sb1.Enabled := False;
  // Bildumschaltung
  timer5.Enabled := True; // Framenr
  if copy(form1.lb1.items[2 + 20], (punkte * 6), 1) = '' then
    timer5.Enabled := False;
  if lb1.items[20 + 1] <> '' then
  begin
    status := 1;
    repeat
      ausgabe_lpt;
    until status = 0;
  end;
  if ((status = 0) and (form1.cb38.Checked = False)) then
    blank_invert;

end;
// Button "Widergabe Stopp"
procedure TForm1.bStopClick(Sender: TObject);
begin
  Status := 0;
  EasyLase_Stop;
  bStart.Enabled := True;
  sb1.Enabled := True;
  timer1.Enabled := False;
  winkel1 := 0;
  // outputcounter / Timer
  timer4.Enabled := False;

  Application.ProcessMessages;
  datei.Enabled := True;
  berpopelscan1.Enabled := True;
  shortcuts1.Enabled := True;
  cb13.Checked := False;
  Application.ProcessMessages;

  panel52.Caption := '0';
  Application.ProcessMessages;

  if (lb1.items[20] <> ' ') and (Status = 0) then
  begin
    image_loeschen;
    Application.ProcessMessages;
    punkte := 0;
    sb1.position := 1;
    bildnr := 1;
    punkte := 0;
    redraw;
    Application.ProcessMessages;
  end;
  if ((Status = 0) and (cb38.Checked = False)) then
  begin
    Blank_invert;
    timer4.Enabled := False;
    timer5.Enabled := False;
  end;

  punkte := 0;


  //Blanken und auf " 0 Output setzen "
  if status = 0 then
  begin
    if cb38.Checked = False then
    begin
      Ausgabe_128;
      Blank_invert;
      exit;
    end
    else
    begin
      Ausgabe_128_TTL;
      exit;
    end;
  end;

end;


// Ausgabe Koordinaten auf Panel
procedure TForm1.iOutputMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  panel5.Caption := IntToStr(x) + ' / ' + IntToStr(y);
end;

// Neuer Punkt  - - - Zeichnen - - -
procedure TForm1.iOutputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if status = 0 then
  begin

    if ssleft in shift then
    begin
      if lastcolor = 2 then
        rb2.Checked := True;
      if lastcolor = 4 then
        rb3.Checked := True;
      if lastcolor = 8 then
        rb4.Checked := True;
      if lastcolor = 6 then
        rb11.Checked := True;
      if lastcolor = 10 then
        rb12.Checked := True;
      if lastcolor = 12 then
        rb13.Checked := True;
      if lastcolor = 14 then
        rb14.Checked := True;
      dcolor := lastcolor;
    end;

    if ssright in shift then
    begin
      if rb2.Checked = True then
        lastcolor := 2;
      if rb3.Checked = True then
        lastcolor := 4;
      if rb4.Checked = True then
        lastcolor := 8;
      if rb11.Checked = True then
        lastcolor := 6;
      if rb12.Checked = True then
        lastcolor := 10;
      if rb13.Checked = True then
        lastcolor := 12;
      if rb14.Checked = True then
        lastcolor := 14;
      port := 1;
      rb1.Checked := True;
    end;
    xneu := x;
    yneu := y;
    // Runden  ? ? ?
    if cb1.Checked = True then
    begin
      xneu := round(xneu / raster) * raster;
      yneu := round(yneu / raster) * raster;
    end
    else
    begin
      xneu := x;
      yneu := y;
    end;
    // Drawmode
    if drawmode = 'lines' then
    begin
      if cb39.Checked = True then
        Linie_interpolieren
      else
        zeichnen;
    end;

    if drawmode = 'circle' then
    begin
      Kreis_malen;
    end;
    punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);
    lb1.items[2] := IntToStr(punkte);
  end;
  // Thorstens Bildpunkte
  panel29.Caption := IntToStr(round(punkte));
end;


// RB 1 Blank
procedure TForm1.rb1Click(Sender: TObject);
begin
  if rb1.Checked = True then
  begin
    Port := 1;
    Dcolor := 1;
  end;
end;
// RB 2 Red
procedure TForm1.rb2Click(Sender: TObject);
begin
  if rb2.Checked = True then
  begin
    Port := 2;
    Dcolor := 2;
    lastcolor := 2;
  end;
end;
// RB 3 Green
procedure TForm1.rb3Click(Sender: TObject);
begin
  if rb3.Checked = True then
  begin
    Port := 4;
    Dcolor := 4;
    lastcolor := 4;
  end;
end;
//RB 4 Blue
procedure TForm1.rb4Click(Sender: TObject);
begin
  if rb4.Checked = True then
  begin
    Port := 8;
    Dcolor := 8;
    lastcolor := 8;
  end;
end;

// Laden von Listbos per Mausklick
procedure TForm1.FileListBox1Click(Sender: TObject);
var
  filename, Name: string;
  a: integer;
begin

  if loadfile = False then
    repeat
      application.ProcessMessages
    until loadfile = True;
  loadfile := False;
  winkel := 180;
  winkhor := 180;
  winkver := 180;
  winkel1 := 360;
  punkte := 0;
  application.ProcessMessages;
  // Mediaplayer MOT to MP3  ? ?
  // Läuft Player ?
{TODO:
if mediaplayer1.filename<>''  then
  begin
    // Aktuelle Position wirklich letzte Zeile ?
    if mediaplayer1.position=0 then mediaplayer1.position:=1;
    if mediaplayer1.position>lastsetpos then
        begin
         name:=extractFilename(filelistbox1.filename);
         memo4.lines[Linienzahl]:=(inttostr(mediaplayer1.position));
         memo4.lines[Linienzahl+1]:=name;
         linienzahl:=linienzahl+2;lastpos:=mediaplayer1.position;
         memo4.refresh;lastpos:=mediaplayer1.position;
         lastsetpos:=mediaplayer1.position;
        end else
        //Ansonsten einsortieren
        begin
        end;
  end;
}

  if status = 1 then
  begin
    if form1.cb38.Checked = False then
      blank_invert;
    image_loeschen;
    if lb1.items[20] <> ' ' then
    begin
      linie := 20;
      redraw;
    end;

    a := 1;
    Application.ProcessMessages;
  end;

  filename := filelistbox1.filename;
  if FileExistsUTF8(filelistbox1.filename) { *Converted from FileExists* } then
  begin
    winkel := 0;
    winkhor := 0;
    winkver := 0;
    Live_file := filename;
    if memo3.Lines.Count < 27 then
    begin
      memo3.Lines.add(filename);
      panel_update;
    end;
    lb1.items.loadfromfile(filename);
    lb1.refresh;
    SB1.position := 0;
    punkte := 0;
    linie := 20;
    neuzeichnen;
    image_loeschen;
    redraw;
    sb4.position := StrToInt(lb1.items[5]);
    panel6.Caption := IntToStr(sb4.position);

    // Ende Punkte ermitteln  }
    Faderupdate;
    if a = 1 then
    begin
      bStart.click;
      Application.ProcessMessages;
      a := 0;
      Application.ProcessMessages;
    end;
  end
  else
    MessageDlg('File nicht vorhanden', mtInformation, [mbOK], 0);
  loadfile := True;
end;
// Löschen von Listbox
procedure TForm1.DeletefromFilelist1Click(Sender: TObject);
var
  filename: string;
begin
  filename := filelistbox1.filename;
  if FileExistsUTF8(FileName) { *Converted from FileExists* } then

    if MessageDlg('Are you sure you want to delete this File ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DeleteFileUTF8(FileName);
  { *Converted from DeleteFile* }filelistbox1.update;
end;

// UNDO Button
procedure TForm1.Button3Click(Sender: TObject);
var
  a: integer;
  b: string;
begin
  // steht  was drin ? ?
  if copy(form1.lb1.items[form1.sb1.position + 20], 1, 1) <> '' then
  begin
    b := form1.lb1.items[form1.sb1.position + 20];
    a := length(b);
    form1.lb1.items[form1.sb1.position + 20] :=
      copy(form1.lb1.items[form1.sb1.position + 20], 1, (a - 6));
    lb1.refresh;
    image_loeschen;
    if bildda = 1 then
    begin
      punkte := 0;
      iOutput.canvas.stretchdraw(rect(0, 0, 256, 256), bild);
      redraw;
    end
    else
    begin
      punkte := 0;
      redraw;
    end;

    punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);

  end;
end;

procedure TForm1.SaveSettings1Click(Sender: TObject);
var
  INI: string;
begin
  // Sichern LPT Adresse
  memo2.Lines[0] := 'LPT Adress';
  memo2.Lines[1] := IntToStr(lptport);
  // Sichern SB7  M-Delay
  memo2.Lines[2] := 'M-Delay';
  memo2.Lines[3] := IntToStr(sb7.position);
  // Sichern Drive
  //TODO:memo2.lines[4]:='Drive';memo2.lines[5]:=drivecombobox1.Drive;
  // Sichern aktuelles Verzeichnis
  //TODO:memo2.lines[6]:='Directory';memo2.lines[7]:=Dlb1.Directory;;
  // Sichern SB2  P-Delay
  memo2.Lines[8] := 'P-Delay';
  memo2.Lines[9] := IntToStr(sb2.position);
  // Sichern SB 3 Blank-Delay
  memo2.Lines[10] := 'Blank-Delay';
  memo2.Lines[11] := IntToStr(sb3.position);
  // Sichern SB 8 V Hor
  memo2.Lines[12] := 'V Hor';
  memo2.Lines[13] := IntToStr(sb8.position);
  // Sichern SB 9 V Ver
  memo2.Lines[14] := 'V Vert';
  memo2.Lines[15] := IntToStr(sb9.position);
  // Sichern SB 6 V Rot
  memo2.Lines[16] := 'V Rot';
  memo2.Lines[17] := IntToStr(sb6.position);
  // Sichen SB 7  Multiplikator
  memo2.Lines[18] := 'Multiplikator';
  memo2.Lines[19] := IntToStr(sb7.position);
  // Sichen SB 16  Gain
  memo2.Lines[20] := 'Gain';
  memo2.Lines[21] := IntToStr(sb16.position);
  // Sichern CB 9  Invert X
  memo2.Lines[22] := 'Invert X';
  if cb9.Checked = True then
    memo2.Lines[23] := '1'
  else
    memo2.Lines[23] := '0';
  // Sichern CB 10  Invert y
  memo2.Lines[24] := 'Invert Y';
  if cb10.Checked = True then
    memo2.Lines[25] := '1'
  else
    memo2.Lines[25] := '0';
  // Sichern CB 9  Swap x/y
  memo2.Lines[26] := 'Invert X';
  if cb11.Checked = True then
    memo2.Lines[27] := '1'
  else
    memo2.Lines[27] := '0';
  // Sichern Comport
  //TODO:memo2.lines[28]:='Comport'; memo2.lines[29]:=inttostr(com.port);
  // Sichern CB 37 Invert Blank
  memo2.Lines[30] := 'Invert blank';
  if cb37.Checked = True then
    memo2.Lines[31] := '1'
  else
    memo2.Lines[31] := '0';
  // Sichern CB38 Switch PCB
  memo2.Lines[32] := 'Switch PCB';
  if cb38.Checked = True then
    memo2.Lines[33] := '1'
  else
    memo2.Lines[33] := '0';
  // Sichern CB25 Key Previev
  memo2.Lines[34] := 'Key Previev';
  if cb35.Checked = True then
    memo2.Lines[35] := '1'
  else
    memo2.Lines[35] := '0';
  // Sichern Aktive Page
  memo2.Lines[36] := 'Active3 Page';
  if pg2.ActivePage = banks then
    memo2.Lines[37] := '1';
  if pg2.ActivePage = mp3 then
    memo2.Lines[37] := '2';
  if pg2.ActivePage = live then
    memo2.Lines[37] := '3';
  if pg2.ActivePage = midi then
    memo2.Lines[37] := '4';
  //Sichern Interpolate Lines
  memo2.Lines[38] := 'Key Previev';
  if cb39.Checked = True then
    memo2.Lines[39] := '1'
  else
    memo2.Lines[39] := '0';

  // getdir(0,hauptverzeichnis);
  ini := hauptverzeichnis + '\ini.dat';
  if MessageDlg('Save Settings to' + #13#10 + #13#10 + ini + #13#10,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    memo2.Lines.savetofile(ini)
  else
    exit;
end;


// Ereignis " Taste gedrückt "
procedure TForm1.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  taborder := 7;
  //if pg2.activepage=live then
  // begin
  form1.pg2.SetFocus;
  taste := key;
  Live_Abruf;

  // end;
end;


// BMP zum abmalen laden
procedure TForm1.Button4Click(Sender: TObject);
begin
  punkte := 0;
  port := 2;
  rb2.Checked := True;
  // Bild laden
  opendialog1.filterindex := 2;
  if opendialog1.Execute then
    bild.loadfromfile(opendialog1.filename);
  bildfile := opendialog1.filename;
  opendialog1.filterindex := 1;
  bildda := 1;
  iOutput.canvas.stretchdraw(rect(0, 0, 256, 256), bild);
  application.ProcessMessages;
  redraw;
  punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  bild.Free;
  {$IFDEF WINDOWS}
  easylaseclose;
  {$ENDIF}
end;

// Bild ausblenden
procedure TForm1.Button5Click(Sender: TObject);
begin
  if bildda = 1 then
  begin
    image_loeschen;
    bildda := 0;
    bildfile := '';
    punkte := 0;
    redraw;
    punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);
  end;
end;

//Beginn Lissajours
procedure TForm1.cb12Click(Sender: TObject);
var
  a1, a2, w1, w2: extended;
  p, pp, bild: integer;

begin
  if cb12.Enabled = True then
  begin

    bStop.click;
    image_loeschen;
    status := 1;
    a1 := 0;
    a2 := 0;
    bild := 0;
    repeat
      w1 := sb10.position;
      w1 := w1 / 50;
      w2 := sb11.position;
      w2 := w2 / 50;
      xneu := round(sin(a1 / 57.3) * sb12.position) + 125;
      yneu := round(cos(a2 / 57.3) * sb13.position) + 125;

      if bild = 0 then
        form1.iOutput.Canvas.MoveTo(xneu, yneu)
      else
        iOutput.Canvas.lineTo(xneu, yneu);
      //Ausgabe  ..geht nicht bei inv. blanking
      Ausgabe_lis;
      if cb37.Checked = True then
        laseran := 1
      else
        laseran := 0;
      bild := 1;
      //Pause
      for p := 1 to (form1.sb2.position * form1.sb7.position) do
      begin
        application.ProcessMessages;
        pp := pp + 1;
      end;

      a1 := a1 + w1;
      a2 := a2 + w2;
      if a1 >= 360 then
      begin
        a1 := 0;
        bild := 0;
        form1.iOutput.canvas.Brush.color := clbtnface;
        form1.iOutput.Canvas.FillRect(rect(0, 0, 258, 258));
      end;
      if a2 >= 360 then
        a2 := 0;
    until cb12.Checked = False;
    // Bei Liss-Ende
    image_loeschen;
    blank_invert;
  end;
end;
// Lissajour Frequenz/ Spannung
procedure TForm1.sb11Change(Sender: TObject);
begin
  panel12.Caption := IntToStr(sb11.position);
end;

procedure TForm1.sb10Change(Sender: TObject);
begin
  panel11.Caption := IntToStr(sb10.position);
end;

procedure TForm1.sb12Change(Sender: TObject);
begin
  panel15.Caption := IntToStr(sb12.position);
end;

procedure TForm1.sb13Change(Sender: TObject);
begin
  panel16.Caption := IntToStr(sb13.position);
end;
// Ende Lissajours

// Begin Rasterwahl
procedure TForm1.rb5Click(Sender: TObject);
begin
  if Rb5.Checked = True then
    Raster := 16;
end;

procedure TForm1.rb6Click(Sender: TObject);
begin
  if Rb6.Checked = True then
    Raster := 8;
end;

procedure TForm1.rb7Click(Sender: TObject);
begin
  if Rb7.Checked = True then
    Raster := 4;
end;
// Ende Rasterwahl


// Live Player Öffenen
procedure TForm1.Start1Click(Sender: TObject);
begin
  cb12.Checked := False;
  cb35.Checked := True;

end;
//Live Settings speichern
procedure TForm1.Button6Click(Sender: TObject);
begin
  savedialog1.filterindex := 3;
  if savedialog1.Execute then
    memo3.Lines.savetofile(savedialog1.filename);
end;
//Live Settings laden
procedure TForm1.Button7Click(Sender: TObject);
begin
  opendialog1.filterindex := 3;
  if opendialog1.Execute then
    memo3.Lines.loadfromfile(opendialog1.filename);
  panel_update;
end;

// Live Settings löschen
procedure TForm1.Button8Click(Sender: TObject);
begin
  memo3.Lines.Clear;
  memo3.Lines.add('Live Settings');
  panel_update;
end;

procedure TForm1.Hilfe2Click(Sender: TObject);
var
  a: string;
begin
  a := hauptverzeichnis + '\hilfe.html';
  //executefile(a,'','',1);
end;



procedure TForm1.cb13Click(Sender: TObject);
begin
  if cb13.Checked = True then
  begin
    if filelistbox1.Items.Count > 1 then
    begin
      Timer1.Enabled := True;
      zufall := 1;

    end;
  end
  else
  begin
    timer1.Enabled := False;
    zufall := 0;

  end;
end;
// Timer für Zufallswiedergabe
procedure TForm1.Timer1Timer(Sender: TObject);
var
  L, a: integer;
var
  b: extended;
begin
  if cb31.Checked = True then
  begin
    b := 60 / (StrToInt(panel28.Caption));
    b := b * 1000;
    a := round(b);
    timer1.interval := a;
  end
  else
    timer1.interval := sb14.position * 1000;

  panel28.color := clred;
  L := Random(filelistbox1.Items.Count);
  if L = 0 then
    L := 1;
  filelistbox1.ItemIndex := L;
  panel28.color := clbtnface;
  FileListBox1Click(Sender);
end;

procedure TForm1.sb14Change(Sender: TObject);
begin
  timer1.interval := sb14.position * 1000;
  panel27.Caption := IntToStr(sb14.position) + ' sec';
end;
// Bankschalter Radiobuttons
procedure TForm1.bs1Click(Sender: TObject);
begin
  psw := 1;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs2Click(Sender: TObject);
begin
  psw := 2;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs3Click(Sender: TObject);
begin
  psw := 4;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs4Click(Sender: TObject);
begin
  psw := 8;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs5Click(Sender: TObject);
begin
  psw := 16;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs6Click(Sender: TObject);
begin
  psw := 32;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs7Click(Sender: TObject);
begin
  psw := 64;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs8Click(Sender: TObject);
begin
  psw := 128;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.bs9Click(Sender: TObject);
begin
  psw := 0;
  if status = 0 then
    ausgabe_bsw;
end;

procedure TForm1.Com11Click(Sender: TObject);
begin
  {TODO:
  com.close;com.port:=1;com.open;

  com11.checked:=true;com21.checked:=false;
  }
end;

procedure TForm1.Com21Click(Sender: TObject);
begin
  {TODO:
  com.close;com.port:=2; com.open;
  com21.checked:=true;com11.checked:=false;
  }
end;

procedure TForm1.pg2Change(Sender: TObject);
begin
  if pg2.ActivePage = live then
    form1.pg2.SetFocus;
end;


procedure TForm1.Panel9Click(Sender: TObject);
begin
  if panel9.color = clbtnface then
    panel9.color := clred
  else
    panel9.color := clbtnface;
end;

procedure TForm1.sb17Change(Sender: TObject);
begin
  panel33.Caption := IntToStr(sb17.position);
  if sb17.position = 0 then
    pumpmax := 100;
end;

procedure TForm1.dlb1Change(Sender: TObject);
begin

end;
// MP3 laden
procedure TForm1.Button9Click(Sender: TObject);
var
  liedname, aktpfad: string;
begin
  button12.click;
  opendialog1.FilterIndex := 4;
{
if opendialog1.execute then liedname:=opendialog1.filename;
 if liedname<>'' then
   begin
      GetDir(0, aktpfad);
      //TODO:dlb1.Directory:=aktpfad;
      mediaplayer1.filename:=liedname;
      mediaplayer1.close;
      mediaplayer1.open;
      panel31.caption:=extractfilename(mediaplayer1.filename);
      tb1.max:=mediaplayer1.Length;
      tb1.Frequency:=round(mediaplayer1.length / 10);
      lastpos:=0;lastsetpos:=0;
      panel34.caption:='';panel34.refresh;
   end;
}
end;
// MP3 Play
procedure TForm1.Button10Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
 begin
   mediaplayer1.play;timer2.enabled:=true;
 end;
}
end;
// MP3 Pause
procedure TForm1.Button11Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
  begin
   mediaplayer1.Pause;
   cuepos:=mediaplayer1.position;
   panel34.caption:=inttostr( mediaplayer1.position);
   cuepos:=mediaplayer1.position;
  end;
}
end;
//MP3 STOP
procedure TForm1.Button12Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
 begin
  mediaplayer1.stop;
  timer2.enabled:=false;
  mediaplayer1.position:=0;tb1.position:=0;
  panel34.caption:='0';panel34.refresh;lastpos:=0;cuepos:=0;
  bStop.click;
 end;
}
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
 begin
  cuepos:=mediaplayer1.position;
  if mediaplayer1.mode=mpplaying then mediaplayer1.pause;
  panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
 end;
}
end;
// Cue+50
procedure TForm1.Button14Click(Sender: TObject);
begin
{TODO:
 if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.pause;
    cuepos:=cuepos+50; mediaplayer1.position:=cuepos;
    if timer2.enabled=false then timer2.enabled:=true;
    panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
    if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
  end;
}
end;
// Cue -50
procedure TForm1.Button15Click(Sender: TObject);
begin
{TODO:
 if mediaplayer1.filename<>'' then
 begin
   mediaplayer1.pause;
   cuepos:=cuepos-50; mediaplayer1.position:=cuepos;
   if timer2.enabled=false then timer2.enabled:=true;
   panel34.caption:=inttostr(mediaplayer1.position);panel34.refresh;
   if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
 end;
}
end;
// Jump to Cue
procedure TForm1.Button16Click(Sender: TObject);
begin
{TODO:
 if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.position:=cuepos;
    if mediaplayer1.mode=mpplaying then mediaplayer1.pause;
    panel34.caption:=inttostr(cuepos);panel34.refresh;
  end;
}
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  Pfad: string;
begin
{TODO:
opendialog1.filterindex:=1;
tb1.position:=mediaplayer1.position; selfchange:=1;
panel34.caption:=inttostr(mediaplayer1.position);
if pstatus=1 then
    begin
       if mediaplayer1.position > zindex then
         begin
           if memo4.lines[plinie]<>'' then
             begin
               timer2.enabled:=false;form1.button2.click;
               pfad:=form1.dlb1.Directory;
               pfile:=pfad+'\'+pfile;
               lb1.items.loadfromfile(pfile);
               lb1.refresh;faderupdate;
               punkte:=0;sb1.position:=1;
               neuzeichnen; image_loeschen; redraw;
               sb4.position:=strtoint(lb1.items[5]);

               if copy(memo4.lines[plinie+2],1,1)<>' ' then
               plinie:=plinie+2
               else pstatus:=0;
               zindex:=strtoint(memo4.lines[plinie]);
               zindexlinie:=plinie;
               pfile:=memo4.lines[plinie+1];
               timer2.enabled:=true;
               bStart.click;
end;end; end;
if mediaplayer1.position=mediaplayer1.TrackLength[1] then button18.click;
}
end;

// Play MP§ + MOT
procedure TForm1.Button17Click(Sender: TObject);
begin
  button12.click;
{TODO:
if (mediaplayer1.filename<>'') and
( memo4.lines[0]<>' ') then
      begin
        mediaplayer1.stop; mediaplayer1.position:=0;
        mediaplayer1.play; timer2.enabled:=true;
        plinie:=0;pstatus:=1;
        zindex:=strtoint(memo4.lines[plinie]);
        pfile:=memo4.lines[plinie+1];
      end;
}
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
{TODO:
 if (mediaplayer1.filename<>'') then
 begin
   mediaplayer1.stop;lastpos:=0;
   mediaplayer1.position:=0;
   panel34.caption:='0';
 end;
 timer2.enabled:=false;plinie:=0; pstatus:=0;
 form1.button2.click;
}
end;
// Load MOTLIST
procedure TForm1.Button19Click(Sender: TObject);
begin
  button12.click;
  opendialog1.FilterIndex := 5;
  if opendialog1.Execute = True then
    memo4.Lines.loadfromfile(opendialog1.filename);
end;

// Save MOTLIST
procedure TForm1.Button20Click(Sender: TObject);
begin
  button12.click;
  savedialog1.FilterIndex := 5;
  if savedialog1.Execute = True then
    memo4.Lines.savetofile(savedialog1.Filename);
end;

procedure TForm1.Button21Click(Sender: TObject);
var
  a: integer;
begin
  button12.click;
  memo4.Clear;
  lastsetpos := 0;
  lastpos := 0;
  for a := 1 to 2000 do
    memo4.Lines.add(' ');
  Linienzahl := 0;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  if linienzahl > 2 then
  begin
    //TODO:if mediaplayer1.mode=mpplaying then mediaplayer1.pause;
    memo4.Lines[linienzahl - 1] := '';
    memo4.Lines[linienzahl - 2] := '';
    linienzahl := linienzahl - 2;
    memo4.refresh;
    lastsetpos := StrToInt(memo4.Lines[linienzahl - 2]);
    cuepos := lastsetpos + 1;
    //TODO:mediaplayer1.position:=cuepos;
    //TODO:panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;

  end
  else // wenn >2 Bzw. 0

  begin
    //TODO:if mediaplayer1.mode=mpplaying then mediaplayer1.pause;
    memo4.Lines[linienzahl - 1] := '';
    memo4.Lines[linienzahl - 2] := '';
    linienzahl := 0;
    memo4.refresh;
    lastsetpos := 0;
    //TODO:cuepos:=lastsetpos+1;mediaplayer1.position:=0;
    tb1.position := 0;
  end;


  if linienzahl > 2 then
  begin
    //TODO:mediaplayer1.position:=strtoint(memo4.lines[linienzahl-2]);
    //TODO:mediaplayer1.play;
  end;
end;

procedure TForm1.tb1Change(Sender: TObject);
begin
{if ((mediaplayer1.filename<>'') and (mediaplayer1.mode=mpplaying))then
 begin
     mediaplayer1.position:=tb1.position;
     mediaplayer1.play;
     selfchange:=1;
  end;  }
end;

procedure TForm1.Play(Sender: TObject);
begin
  //TODO:mediaplayer1.play;
end;

procedure TForm1.cb14Click(Sender: TObject);
begin
  // Blanken und auf " 0 Output setzen "
  ausgabe_128;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  panel32.Caption := 'Fog ' + IntToStr(updown1.position) + ' s.';
  timer3.interval := 1000 * updown1.position;
end;

procedure TForm1.Panel32Click(Sender: TObject);
begin
  if panel32.color = clbtnface then
  begin
    panel32.color := clred;
    panel32.refresh;
    //TODO:com.rts:=true;
    timer3.Enabled := True;
  end
  else
  begin
    panel32.color := clbtnface;
    panel32.refresh;
    //TODO:com.rts:=false;
    timer3.Enabled := False;
  end;

end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  panel32.color := clbtnface;
  panel32.refresh;
  //TODO:com.rts:=false;
  timer3.Enabled := False;
end;

procedure TForm1.berPopelscan1Click(Sender: TObject);
begin
  if MessageDlg('Popelscan Freeware by G. Jaeger' + #13#10 + 'Spenden werden jederzeit angenommen..' + #13#10 + 'Bei Fragen oder Anregungen zur  ' + #13 + #10 + 'Erweiterung Mail an        ' + #13 + #10 + 'calibra301@aol.com  ' + #13#10 + #10 + 'www.mylaserpage.de  ', mtConfirmation, [mbOK], 0) = mrYes then;

end;


// BPM Eingabe
procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  panel28.Caption := IntToStr(updown2.position);
  panel28.refresh;
end;

procedure TForm1.cb31Click(Sender: TObject);
var
  a: integer;
var
  b: double;
begin
  if cb31.Checked = True then
  begin
    b := 60 / (StrToInt(panel28.Caption));
    b := b * 1000;
    a := round(b);
    timer1.interval := a;
  end
  else
    timer1.interval := sb14.position * 1000;
end;


// Shortcuts einblenden
procedure TForm1.Shortcuts1Click(Sender: TObject);
begin
  if MessageDlg('      Shortcuts         ' + #13#10 + '                        ' + #13#10 + 'ENTER Startet Ausgabe  ' + #13#10 + 'ESC   Stoppt Ausgabe    ' + #13#10 + '                        ' + #13#10 + 'F3   Random ein/aus     ' + #13 + #10 + 'Bild auf Randomtimer +  ' + #13 + #10 + 'Bild ab  Randomtimer -  ' + #13 + #10 + '                        ' + #13#10 + 'F2   Motfile Speichern  ' + #13 + #10 + '                        ' + #13#10 + 'F5   MP3 Play           ' + #13 + #10 + 'F6   Cue -50            ' + #13#10 + 'F7   Cue +50            ' + #13#10 + 'F7   MP3 Stop           ', mtConfirmation, [mbOK], 0) = mrYes then;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.pause;
    cuepos:=cuepos+5; mediaplayer1.position:=cuepos;
    if timer2.enabled=false then timer2.enabled:=true;
    panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
    if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
  end;
}
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
{TODO:
if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.pause;
    cuepos:=cuepos-5; mediaplayer1.position:=cuepos;
    if timer2.enabled=false then timer2.enabled:=true;
    panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
    if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
  end;
}
end;


procedure TForm1.tb2Change(Sender: TObject);
begin
  tb2.position := round((tb2.position / 5)) * 5;
  winkel1max := tb2.position div 4;
  panel51.Caption := IntToStr(tb2.position);
end;

procedure TForm1.cb3Click(Sender: TObject);
begin
  if cb3.Checked = True then
    cb33.Checked := False;
  winkel1 := 0;
end;

procedure TForm1.cb33Click(Sender: TObject);
begin
  if cb33.Checked = True then
    cb3.Checked := False;
  winkel1 := 0;
end;

procedure TForm1.cb34Click(Sender: TObject);
begin
  image_loeschen;
  punkte := 0;
  redraw;
  punkte := round(length(lb1.items[form1.sb1.position + 20]) / 6);
  panel29.Caption := IntToStr(round(punkte));
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  lb1.items.Delete(sb1.position + 20);
  image_loeschen;
  punkte := 0;
  redraw;

end;

procedure TForm1.cb35Click(Sender: TObject);
begin
  if cb35.Checked = True then
    form1.keypreview := True
  else
    form1.keypreview := False;
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  lb1.items.Insert(sb1.position + 20, '');

  image_loeschen;
  punkte := 0;
  redraw;
end;



procedure TForm1.iOutputPaint(Sender: TObject);
begin
  image_loeschen;
end;


// MIDI Funtions
procedure GetStrings(statusm: integer; var s1, s2, s3: string);
begin
  case statusm of
    128..143:
    begin
      s1 := 'Note Off: ';
      s2 := 'Tonnummer: ';
      s3 := 'Velocity-Wert: ';
    end;
    144..159:
    begin
      s1 := 'Note On: ';
      s2 := 'Tonnummer: ';
      s3 := 'Velocity-Wert: ';
    end;
    160..175:
    begin
      s1 := 'Poly Pressure: ';
      s2 := 'Tonnummer: ';
      s3 := 'Druck-Wert: ';
    end;
    176..191:
    begin
      s1 := 'Control Change: ';
      s2 := 'Contr.-Nr: ';
      s3 := 'Contr.-Stellung: ';
    end;
    192..207:
    begin
      s1 := 'Program Change: ';
      s2 := 'Progr.-Nr: ';
      s3 := '';
    end;
    208..223:
    begin
      s1 := 'Mono Pressure: ';
      s2 := 'Druck-Wert: ';
      s3 := '';
    end;
    224..239:
    begin
      s1 := 'Pitch Wheel: ';
      s2 := 'Tonhöhe LSB: ';
      s3 := 'Tonhöhe MSB: ';
    end;
    240:
    begin
      s1 := 'System Exclusive (Anfang): ';
      s2 := '';
      s3 := '';
    end;
    241:
    begin
      s1 := 'MIDI-Timecode: ';
      s2 := 'Typ/Wert: ';
      s3 := '';
    end;
    242:
    begin
      s1 := 'Song Position: ';
      s2 := 'Song Pos. LSB: ';
      s3 := 'Song Pos. MSB: ';
    end;
    243:
    begin
      s1 := 'Song Select: ';
      s2 := 'Song Nr: ';
      s3 := '';
    end;
    244:
    begin
      s1 := 'N.D.: ';
      s2 := '';
      s3 := '';
    end;
    245:
    begin
      s1 := 'N.D.: ';
      s2 := '';
      s3 := '';
    end;
    246:
    begin
      s1 := 'Tune Request: ';
      s2 := '';
      s3 := '';
    end;
    247:
    begin
      s1 := 'System Exclusive (Ende): ';
      s2 := '';
      s3 := '';
    end;
    248:
    begin
      s1 := 'MIDI-Clock: ';
      s2 := '';
      s3 := '';
    end;
    249:
    begin
      s1 := 'N.D.: ';
      s2 := '';
      s3 := '';
    end;
    250:
    begin
      s1 := 'Start: ';
      s2 := '';
      s3 := '';
    end;
    251:
    begin
      s1 := 'Continue: ';
      s2 := '';
      s3 := '';
    end;
    252:
    begin
      s1 := 'Stop: ';
      s2 := '';
      s3 := '';
    end;
    253:
    begin
      s1 := 'N.D.: ';
      s2 := '';
      s3 := '';
    end;
    254:
    begin
      s1 := 'Active Sensing: ';
      s2 := '';
      s3 := '';
    end;
    255:
    begin
      s1 := 'Reset: ';
      s2 := '';
      s3 := '';
    end;
  end;
end;


procedure CloseMidiIn;
begin
{TODO:
  if MidiInOpened then
  begin
    TODO:midiInReset (MidiInHandle);
    midiInClose (MidiInHandle);
    MidiInOpened := FALSE;
  end;
}
end;

procedure OpenMidiIn(DeviceID: integer);
begin
{TODO:
  CloseMidiIn;
  MidiInOpened := midiInOpen (@MidiInHandle, DeviceID, Form1.Handle, 0, CALLBACK_WINDOW) = MMSYSERR_NOERROR;
}
end;

procedure StartMidiIn;
begin
  //  if MidiInOpened then midiInStart (MidiInHandle);
end;

procedure StopMidiIn;
begin
  //  if MidiInOpened then midiInStop (MidiInHandle);
end;

procedure ResetMidiIn;
begin
  //  if MidiInOpened then midiInReset (MidiInHandle);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //TODO:OpenMidiIn (0);
  //TODO:GetMidiInDevs;
  //TODO:StartMidiIn;
end;


// ENDE MIDI FUNKTIONS



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopMidiIn;
  ResetMidiIn;
  CloseMidiIn;

end;



procedure TForm1.ComboMidiInChange(Sender: TObject);
begin
  OpenMidiIn(ComboMidiIn.ItemIndex);
  StartMidiIn;
end;


procedure TForm1.midiShow(Sender: TObject);
begin

end;


// 10 sec Vorspulen
procedure TForm1.Button25Click(Sender: TObject);
begin
{TODO:
 if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.pause;
    mediaplayer1.position:=mediaplayer1.position+10000;
    if timer2.enabled=false then timer2.enabled:=true;
    panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
    if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
  end;
}
end;
// 10 sec zurückspulen
procedure TForm1.Button28Click(Sender: TObject);
begin
{TODO:
 if mediaplayer1.filename<>'' then
  begin
    mediaplayer1.pause;
    if mediaplayer1.position>1000 then
    mediaplayer1.position:=mediaplayer1.position-10000 else
    mediaplayer1.position:=0;
    if timer2.enabled=false then timer2.enabled:=true;
    panel34.caption:=inttostr( mediaplayer1.position);panel34.refresh;
    if cb32.checked=true then mediaplayer1.play else mediaplayer1.stop;
  end;
}
end;

// Monitor Ausschalten
procedure TForm1.Button29Click(Sender: TObject);
begin
  //SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 1);
end;

// Ausgabetimer pps
procedure TForm1.Timer4Timer(Sender: TObject);
begin
  panel52.Caption := IntToStr(outputcounter div 3) + ' pps';
  outputcounter := 0;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  Bildumschalten := True;
end;

procedure TForm1.sb16Change(Sender: TObject);
begin
  panel30.Caption := IntToStr(sb16.position);
end;
// Aktivieren der 16 Bit Ausgabe
procedure TForm1.cb38Click(Sender: TObject);
begin
  if cb38.Checked = True then
  begin
    panel53.Caption := 'Enabled';

  end
  else
  begin
    panel53.Caption := 'Disabled';
  end;

end;

procedure TForm1.Hex10001Click(Sender: TObject);
begin
  begin
    lptport := 57344;
    panel8.Caption := 'Port=57344';
  end;

end;

procedure TForm1.tb3Change(Sender: TObject);
begin
  panel54.Caption := IntToStr(tb3.position);
end;

procedure TForm1.rb8Click(Sender: TObject);
begin
  if Rb8.Checked = True then
    Raster := 32;
end;




procedure TForm1.rb9Click(Sender: TObject);
begin
  if rb9.Checked = True then
  begin
    Drawmode := 'lines';
    label57.Caption := 'Click Points with left Mouskey, Blank with right';
  end;
end;

procedure TForm1.rb10Click(Sender: TObject);
begin
  if rb10.Checked = True then
  begin
    Drawmode := 'circle';
    crstart := True;
    label57.Caption := 'Click Circle-Center';
  end;
end;

procedure TForm1.rb11Click(Sender: TObject);
begin
  if rb11.Checked = True then
  begin
    Port := 6;
    Dcolor := 6;
    lastcolor := 6;
  end;
end;

procedure TForm1.rb12Click(Sender: TObject);
begin
  if rb12.Checked = True then
  begin
    Port := 10;
    Dcolor := 10;
    lastcolor := 10;
  end;
end;

procedure TForm1.rb13Click(Sender: TObject);
begin
  if rb13.Checked = True then
  begin
    Port := 12;
    Dcolor := 12;
    lastcolor := 12;
  end;
end;

procedure TForm1.rb14Click(Sender: TObject);
begin
  if rb14.Checked = True then
  begin
    Port := 14;
    Dcolor := 14;
    lastcolor := 14;
  end;
end;

procedure TForm1.cb37Click(Sender: TObject);
begin
  //if cb38.checked=true then cb37.checked:=false;
  // Zwangsabschaltung vonb Inv. Blank bei Switch PCB
end;

procedure TForm1.midikeyoffsetChange(Sender: TObject);
begin
  panel56.Caption := IntToStr(midikeyoffset.position);
  keyoffset := midikeyoffset.position;
end;




procedure TForm1.Button31Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 511 do
    DMX_Buffer[i] := 255;
  DMX_Out;
end;

procedure TForm1.Button30Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 511 do
    DMX_Buffer[i] := 0;
  DMX_Out;
end;

initialization
  MidiInOpened := False;

end.