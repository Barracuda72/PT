unit PT4Data;

{
  Модуль работы с данными
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PT4Common;

type
  ElemType = (TBool, TInt, TChar, TReal, TPChar, TPoint);
  PDElem = ^DElem;
  DElem = record
    Cmt : string;
    Next : PDElem;
    case T : ElemType of
      TBool : (B : boolean);
      TInt : (I : integer);
      TChar : (C : char);
      TReal : (R : real);
      TPChar : (PC : PChar);
      TPoint : (P : PNode);
  end;

procedure DataInit;
procedure DataFini;

procedure AddToData(var X; T : ElemType);
procedure AddToCheck(var X; T : ElemType);
procedure AddToResult(var X; T : ElemType);

function GetData : PDElem;

procedure DumpData;
procedure DumpResult;
procedure DumpCheck;

implementation

var
  Data, // Исходные данные программы
  Result,  // Необходимый результат
  Check    // Полученный результат
    : PDElem;

procedure DumpList(X : PDElem);
begin
  // FIXME
  if (X <> nil) then begin
    case X^.T of
      TInt : write(X^.I);
      TBool : write(X^.B);
      TChar : write(X^.C);
      TReal : write(X^.R);
    end;
    write(' ');
    DumpList(X^.next);
  end;
end;

procedure DumpData;
begin
  DumpList(Data);
  writeln;
end;

procedure DumpCheck;
begin
  DumpList(Check);
  writeln;
end;

procedure DumpResult;
begin
  DumpList(Result);
  writeln;
end;

function GetData : PDElem;
var
  Q : PDElem;
begin
  // FIXME
  Q := Data;
  Data := Data^.Next;
  GetData := Q;
end;

procedure DataInit;
begin
  Data := nil;
  Result := nil;
end;

procedure DestroyList(P : PDElem);
begin
  if (P <> nil) then begin
    DestroyList(P^.Next);
    Dispose(P);
  end;
end;

procedure DataFini;
begin
  DestroyList(Data);
  DestroyList(Check);
  DestroyList(Result);
end;

procedure AddToList(var X; T : ElemType; var P : PDElem);
var
  Q : PDElem;
  X_I : integer absolute X;
  X_B : boolean absolute X;
  X_C : char absolute X;
  X_PC : PChar absolute X;
  X_R : real absolute X;
begin
  if (P = nil) then begin
    New(Q);
    Q^.T := T;
    Q^.Next := nil;
    // FIXME
    case T of
      TInt : Q^.I := X_I;
      TBool : Q^.B := X_B;
      TChar : Q^.C := X_C;
      TReal : Q^.R := X_R;
      //TInt : Q^.I := X_I;
    end;

    P := Q;
  end else
    AddToList(X, T, P^.Next);
end;

procedure AddToData(var X; T : ElemType);
begin
  AddToList(X, T, Data);
end;

procedure AddToCheck(var X; T : ElemType);
begin
  AddToList(X, T, Check);
end;

procedure AddToResult(var X; T : ElemType);
begin
  AddToList(X, T, Result);
end;

end.

