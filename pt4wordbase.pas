unit PT4WordBase;

{
  База слов и выражений
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  RuNumWords = 4;
  EnNumWords = 4;
  RuNumSent = 4;
  EnNumSent = 4;
  RuNumText = 1;
  EnNumText = 1;

function RuGetWord(N : integer) : string;
function RuGetSentence(N : integer) : string;
function RuGetText(N : integer) : string;
function EnGetWord(N : integer) : string;
function EnGetSentence(N : integer) : string;
function EnGetText(N : integer) : string;

implementation

const
  RuWords : array [1..RuNumWords] of string =
    ('Слово', 'каракатица', 'Усть-Мусохранск', 'Синхрофазотрон');
  RuSents : array [1..RuNumSent] of string =
    ('От топота копыт', 'Мал еж, да колюч', 'Крокодилы не летают', 'Пушки не игрушки');
  RuTexts : array [1..RuNumText] of string =
    ('Это текст. Он прост. Запятых здесь нет, как и дефисов - все просто.');
  EnWords : array [1..EnNumWords] of string =
    ('Help', 'Duck', 'Gentoo', 'capital');
  EnSents : array [1..EnNumSent] of string =
    ('A quick brown fox.', 'Duck duck go!', 'Kill it with fire!', 'Nobody cares.');
  EnTexts : array [1..EnNumText] of string =
    ('London is a capital of Great britain. Yo, dunno now you, brazza?');

function RuGetWord(N : integer) : string;
begin
  RuGetWord := RuWords[N+1];
end;

function RuGetSentence(N : integer) : string;
begin
  RuGetSentence := RuSents[N+1];
end;

function RuGetText(N : integer) : string;
begin
  RuGetText := RuTexts[N+1];
end;

function EnGetWord(N : integer) : string;
begin
  EnGetWord := EnWords[N+1];
end;

function EnGetSentence(N : integer) : string;
begin
  EnGetSentence := EnSents[N+1];
end;

function EnGetText(N : integer) : string;
begin
  EnGetText := EnTexts[N+1];
end;

end.

