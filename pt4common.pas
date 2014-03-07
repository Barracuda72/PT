unit PT4Common;

{
  Некоторые полезные общие функции
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  {$IFDEF WIN32}
  Windows
  {$ELSE}
  System
  {$ENDIF};

type
  TProc = procedure;// stdcall;
  TProcS = procedure (S: PChar); stdcall;

  PInt = ^integer;
  TInitTaskProc = procedure(N: integer);
  PNode = ^TNode;
  TNode = record
    Data: integer;
    Next: PNode;
    Prev: PNode;
    Left: PNode;
    Right: PNode;
    Parent: PNode;
  end;

const
  {$IFDEF WIN32}
  RootPath = 'C:\PABCWork.NET\';
  PT4LibPath = 'C:\Program Files\PascalABC.NET\PT4\PT4pabc.dll';
  LibSuffix = '.dll';
  {$ELSE}
  RootPath = '~/PABCWork.NET/';
  PT4LibPath = '/usr/lib/PT4/PT4pabc.so';
  LibSuffix = '.so';
  {$ENDIF}

function isdigit(x : char) : boolean;

function GetLocaleID : integer;

function GetLibPath(S : string) : string;

implementation

function isdigit(x : char) : boolean;
begin
  isdigit := (ord(x) <= ord('9')) and (ord(x) >= ord('0'));
end;

function GetLocaleID : integer;
begin
  {$IFDEF WIN32}
  GetLocaleID := GetThreadLocale;
  {$ELSE}
  GetLocaleID := $409; // English, 419 - русский
  {$ENDIF}
end;

function GetLibPath(S : string) : string;
begin
  GetLibPath := RootPath + 'PT4' + S + LibSuffix;
end;

end.

