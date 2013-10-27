unit BAIOPort;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ComAbout, DsgnIntf;

type
  TBAIOPort = class(TComponent)
  private
    { Private declarations }
    FPortAddress: word;
    FPortData: byte;
    FAbout: string;
  protected
    { Protected declarations }
    {$IFDEF WIN32}
    procedure ValidateRename(AComponent: TComponent; const CurName, NewName: string);  override;
    {$ENDIF}
  public
    { Public declarations }
    procedure Write;
    procedure Reset;
    procedure Read;
    procedure WritePort(PortValue, DataValue: word);
    procedure ResetPort(PortValue: word);
    function ReadPort(PortValue: word): word;
  published
    { Published declarations }
    property PortAddress: word read FPortAddress write FPortAddress;
    property PortData: byte read FPortData write FPortData;
    property About: string read FAbout write FAbout;
  end;

  { AboutTypeProperty }

type
  TAboutTypeProperty = class(TPropertyEditor)
  private

  public
     function GetValue: string; override;
     procedure SetValue(const Value: string); override;
     procedure Edit; override;
     function GetAttributes: TPropertyAttributes; override;
  end;


var
   AboutIOPort: TAboutComponent;

procedure Register;
procedure RunAboutBox;

implementation

procedure Register;
begin
  RegisterComponents('BealeARTS', [TBAIOPort]);
  RegisterPropertyEditor(TypeInfo(string), TBAIOPort, 'About', TAboutTypeProperty);
end;


{$IFDEF WIN32}
procedure TBAIOPort.ValidateRename(AComponent: TComponent;
  const CurName, NewName: string);
begin
  if (AComponent <> nil) and (CompareText(CurName, NewName) <> 0) and
    (FindComponent(NewName) <> nil) then
    raise EComponentError.CreateFmt('A component named %s already exists.', [NewName]);
end;
{$ENDIF}


procedure TBAIOPort.Write;
begin
    WritePort(FPortAddress,FPortData);
end;


procedure TBAIOPort.Reset;
begin
     ResetPort(FPortAddress);
end;


procedure TBAIOPort.Read;
begin
   FPortData := ReadPort(FPortAddress);
end;



procedure TBAIOPort.WritePort(PortValue, DataValue:word);
begin
DataValue := (DataValue*256)+DataValue;
     asm

     Mov ax,DataValue
     Mov dx,PortValue
     Out dx,ax

     end;
end;


procedure TBAIOPort.ResetPort(PortValue: word);
begin
     asm

     Mov ax,0
     Mov dx,PortValue
     Out dx,ax

     end;
end;


function TBAIOPort.ReadPort(PortValue: word): word;
var
   ReadData: word;
begin
     asm

     Mov dx,PortValue
     In ax,dx
     Mov ReadData,ax

     end;
Result := Byte(ReadData);
end;


procedure RunAboutBox;
begin
 { Create dialog in memory }
     AboutIOPort := TAboutComponent.Create(Application);

     { Set dialog strings }
     AboutIOPort.ProductName.Caption := 'BAIOPort';
     AboutIOPort.Caption := 'About BAIOPort';
     AboutIOPort.Copyright.Caption := 'Copyright 1998, David Beale';

AboutIOPort.Memo.Lines.Add('Properties');
AboutIOPort.Memo.Lines.Add('_______________________________________________');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('About - String');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Displays this about dialog. Performs no function when set from within your code.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Name - String');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Name of this component, ie IconDialog1.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('PortAddress - Word');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Sets the port to be used (0-65536).');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('PortData - Byte');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Sets or gets value of the ports data (0-255).');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Tag - LongInt');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Components Tag.');

AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Events');
AboutIOPort.Memo.Lines.Add('_______________________________________________');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');

AboutIOPort.Memo.Lines.Add('Methods');
AboutIOPort.Memo.Lines.Add('_______________________________________________');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Read - Procedure');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Reads the value of the port at PortAddress and places it in PortData.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('ReadPort(AddressValue: Word): Byte - Function');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Reads and returns the value of the port at AddressValue.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Reset - Procedure');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Resets the port at PortAddress to 0.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('ResetPort(AddressValue: Word) - Procedure');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Resets the port at AddressValue to 0.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Write - Procedure');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Writes the value of PortData to the Port at PortAddress.');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('WritePort(AddressValue: Word, DataValue: Byte) - Procedure');
AboutIOPort.Memo.Lines.Add('');
AboutIOPort.Memo.Lines.Add('Writes the value of DataValue to the port at AddressValue.');

  { Set result to OK }
    AboutIOPort.Icon := Application.Icon;
    AboutIOPort.ShowModal;

AboutIOPort.Free
end;



function TAboutTypeProperty.GetValue: string;
begin
Result := 'BAIOPort';
end;

procedure TAboutTypeProperty.SetValue(const Value: string);
begin
RunAboutBox;
end;

procedure TAboutTypeProperty.Edit;
begin
RunAboutBox;
end;

function TAboutTypeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;



end.
