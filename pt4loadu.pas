unit pt4loadu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ComCtrls, Menus, PT4Common;

type

  { TPTULoadForm1 }

  TPTULoadForm1 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TBitBtn;
    Edit1: TEdit;
    Edit2: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    MenuItem1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    StaticText1: TLabel;
    StaticText2: TStaticText;
    UpDown1: TUpDown;
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  PByte = ^byte;
  PInt = ^integer;

function PT4Load(p1, p2 : PByte; Marker : PChar; p3 : PInt;
                 p4 : integer; Name, Path : PChar) : integer; stdcall;
function PT4GetDatInfo : PChar; stdcall;

implementation
{$R *.dfm}

var
  Form1 : TPTULoadForm1;

procedure ShowLoadForm;
begin
  Application.Initialize;
  Form1 := TPTULoadForm1.Create(nil);
  Form1.Caption := 'PT4 Load';
  Form1.Show;
  Application.Run;
end;

procedure CreateTaskFile(WDir, Task : PChar);
var
  f : text;
  S : PChar;
begin
  strcopy(S, PChar(WDir + '' + Task + '.pas'));
  assign(f, S);
  rewrite(f);
  writeln(f, 'uses PT4;');
  writeln(f);
  writeln(f, 'begin');
  writeln(f, '  Task(''', Task, ''');');
  writeln(f, 'end.');
  close(f);
end;

function PT4Load(p1, p2 : PByte; Marker : PChar; p3 : PInt;
                 p4 : integer; Name, Path : PChar) : integer; stdcall;

begin
  //param^ := 1;
  ShowLoadForm();

  if (Form1.Edit1.Text <> '') then begin
    strcopy(Name, PChar(Form1.Edit1.Text));
    CreateTaskFile(RootPath, Name);
    strcopy(Path, PChar(RootPath + Name + '.pas'));
  end;

  PT4Load := 1;
end;

function PT4GetDatInfo : PChar; stdcall;
begin
  PT4GetDatInfo := 'DuckIt';
end;

{ TPTULoadForm1 }

procedure TPTULoadForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

