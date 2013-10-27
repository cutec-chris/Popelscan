unit COMABOUT;

{$MODE Delphi}

interface

uses LCLType, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs;

type
  TAboutComponent = class(TForm)
    Memo: TMemo;
    Back: TImage;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    Copyright: TLabel;
    Shareware: TLabel;
    More: TLabel;
    WebBrower: TButton;
    ProductName: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    procedure WebBrowerClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutComponent: TAboutComponent;

implementation

{$R *.lfm}

procedure TAboutComponent.WebBrowerClick(Sender: TObject);
begin
{
if ShellExecute(Application.Handle,PChar('open'),PChar('HTTP://WWW.GEOCITIES.COM/CAPECANAVERAL/9646'),PChar(''),nil,SW_NORMAL)
 < 33 then
if ShellExecute(Application.Handle,PChar('open'),PChar('netscape.exe'),PChar('HTTP://WWW.GEOCITIES.COM/CAPECANAVERAL/9646')
,nil,SW_NORMAL) < 32 then
if ShellExecute(Application.Handle,PChar('open'),PChar('iexplore.exe'),PChar('HTTP://WWW.GEOCITIES.COM/CAPECANAVERAL/9646')
,nil,SW_NORMAL) < 32 then
   showmessage ('Sorry your web browser could not be found');
}
end;

procedure TAboutComponent.FormPaint(Sender: TObject);
var
   X,Y: byte;
begin
for X := 0 to 3 do
for Y := 0 To 3 do
    Canvas.Draw(Back.Picture.Bitmap.Width*X,Back.Picture.Bitmap.Height*Y,Back.Picture.Bitmap);
end;

procedure TAboutComponent.BitBtn1Click(Sender: TObject);
begin
Close;
end;

end.
