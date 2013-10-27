unit BAIOPORT;

{$MODE Delphi}

interface

uses
  SysUtils, LCLType, LMessages, Classes, Graphics, Controls,
  Forms, Dialogs, ComAbout;

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

implementation

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
   {
  DataValue := (DataValue*256)+DataValue;
  asm
     Mov ax,DataValue
     Mov dx,PortValue
     Out dx,ax
  end;
  }
end;


procedure TBAIOPort.ResetPort(PortValue: word);
begin
   {
     asm

     Mov ax,0
     Mov dx,PortValue
     Out dx,ax

     end;
   }
end;


function TBAIOPort.ReadPort(PortValue: word): word;
var
   ReadData: word;
begin
   {
     asm

     Mov dx,PortValue
     In ax,dx
     Mov ReadData,ax

     end;
Result := Byte(ReadData);
}
end;

end.