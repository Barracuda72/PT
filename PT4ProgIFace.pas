unit PT4ProgIFace;

{
  Интерфейс между задачником и тестируемой программой
}
{$mode objfpc}{$H+}

interface

uses PT4Common, dynlibs, SysUtils, PT4LibIFace, PT4Data;

procedure StartPT(options: integer); stdcall;
procedure FreePT; stdcall;
function CheckPTF({var }res: PInt) : PChar; stdcall;
procedure RaisePT(s1,s2: PChar); stdcall;
procedure Task(name: PChar); stdcall;
procedure GetR(var param: real); stdcall;
procedure PutR(param: real); stdcall;
procedure GetN(var param: integer); stdcall;
procedure PutN(param: integer); stdcall;
procedure GetC(var param: char); stdcall;
procedure PutC(param: char); stdcall;
//procedure GetS(param: System.Text.PCharBuilder);
procedure GetS(param: PChar); stdcall;
procedure PutS(param: PChar); stdcall;
procedure GetB(var param: integer); stdcall;
procedure PutB(param: integer); stdcall;
procedure GetP(var param: IntPtr); stdcall;
procedure PutP(param: IntPtr); stdcall;
procedure DisposeP(sNode: IntPtr); stdcall;

procedure Show(s: PChar); stdcall;
procedure HideTask; stdcall;

implementation

var
  hLib : TLibHandle;

procedure StartPT(options: integer); stdcall;
begin
  writeln('Starting PT...');
end;

procedure FreePT; stdcall;
begin
  writeln('Freeing PT...');
  DataFini;
  FreeLibrary(hLib);
end;

function CheckPTF(res: PInt) : PChar; stdcall;
begin
  writeln('Checking... '{, res^});
  write('Got : ');
  DumpCheck;
  write('Correct result : ');
  DumpResult;
  // res = 0 => Все пучком
  CheckPTF := 'OK';
end;

procedure RaisePT(s1, s2: PChar); stdcall;
begin
  writeln('RaisePT: ', s1, ' - ', s2);
end;

procedure Task(name: PChar); stdcall;
var
  i, N : integer;
  Lib : PChar;
  activate : TProcS;
  InitTaskGroup : TProc;
begin
  writeln('Task ', name);
  i := 1;
  while (i < length(name)) and not isdigit(name[i]) do
    inc(i);

  if (i < length(name)) then begin
    lib := PChar(GetLibPath(Copy(name, 1, i)));
    writeln('> Loading ' + lib);
    hLib := LoadLibrary(lib);
    activate := TProcS(GetProcAddress(hLib, 'activate'));
    InitTaskGroup := TProc(GetProcAddress(hLib, 'inittaskgroup'));

    activate(PT4LibPath);
    InitTaskGroup;

    DataInit;

    N := StrToInt(Copy(name, i+1, 3));

    RunTask(N);

    write('Source data: ');
    DumpData;
  end;
end;

procedure GetR(var param: real); stdcall;
var
  Q : PDElem;
begin
  // FIXME
  Q := GetData;
  param := Q^.R;
end;

procedure PutR(param: real); stdcall;
begin
  AddToCheck(param, TReal);
end;

procedure GetN(var param: integer); stdcall;
var
  Q : PDElem;
begin
  // FIXME
  Q := GetData;
  param := Q^.I;
end;

procedure PutN(param: integer); stdcall;
begin
  AddToCheck(param, TInt);
end;

procedure GetC(var param: char); stdcall;
var
  Q : PDElem;
begin
  // FIXME
  Q := GetData;
  param := Q^.C;
end;

procedure PutC(param: char); stdcall;
begin
  AddToCheck(param, TChar);
end;

//procedure GetS(param: System.Text.StringBuilder);
procedure GetS(param: PChar); stdcall;
var
  Q : PDElem;
begin
  // FIXME
  Q := GetData;
  StrCopy(param, Q^.PC);

end;

procedure PutS(param: PChar); stdcall;
begin
  AddToCheck(PChar(param), TPChar);
end;

procedure GetB(var param: integer); stdcall;
var
  Q : PDElem;
begin
  // FIXME
  Q := GetData;
  param := ord(Q^.B);
end;

procedure PutB(param: integer); stdcall;
var
  Q : boolean;
begin
  Q := param=1;
  AddToCheck(Q, TBool);
end;

procedure GetP(var param: IntPtr); stdcall;
begin
end;

procedure PutP(param: IntPtr); stdcall;
begin
  writeln('#ParamP = ',param);
end;

procedure DisposeP(sNode: IntPtr); stdcall;
begin
  writeln('#DisposeP called');
end;


procedure Show(s: PChar); stdcall;
begin
  writeln('Show: ', AnsiToUTF8(s));
end;

procedure HideTask; stdcall;
begin
  writeln('#HideTask called');
end;

end.

