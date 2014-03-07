unit PT4LibIFace;

{
  Интерфейс между задачником и библиотекой заданий
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PT4Common, PT4Data, PT4WordBase;

procedure RunTask(N : integer);

// Создает группу заданий
procedure CreateGroup(GroupName, GroupDesc, GroupAuthor, GroupKey: string;
  TaskCount: integer; InitTaskProc: TInitTaskProc); stdcall;

// Добавляет к группе задания другой группы
procedure UseTask(GroupName: string; TaskNumber: integer); stdcall;

// Создает задание
procedure CreateTask(SubgroupName: string); stdcall;
procedure CreateTask2(SubgroupName: string; var N : integer); stdcall;

// Возвращает код текущего языка
function CurrentLanguage: integer; stdcall;

// Возвращает локаль 'ru'/'en'
function CurrentLocale: string; stdcall;

// Версия задачника '4.11'
function CurrentVersion: string; stdcall;

// Добавляет строку к заданию
procedure TaskText(S: string; X, Y: integer); stdcall;

// Добавление элементов к исходным данным
// Логического
procedure DataB(Cmt: string; B: integer; X, Y: integer); stdcall;
// Целочисленного
procedure DataN(Cmt: string; N: integer; X, Y, W: integer); stdcall;
procedure DataN2(Cmt: string; N1, N2: integer; X, Y, W: integer); stdcall;
procedure DataN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); stdcall;
// Вещественного
procedure DataR(Cmt: string; R: real; X, Y, W: integer); stdcall;
procedure DataR2(Cmt: string; R1, R2: real; X, Y, W: integer); stdcall;
procedure DataR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); stdcall;
// Символьного
procedure DataC(Cmt: string; C: char; X, Y: integer); stdcall;
//Строкового
procedure DataS(Cmt: string; S: string; X, Y: integer); stdcall;
// Узел (PNode)
procedure DataP(Cmt: string; NP: integer; X, Y: integer); stdcall;
// Просто комментарий
procedure DataComment(Cmt: string; X, Y: integer); stdcall;
// Файлы
procedure DataFileN(FileName: string; Y, W: integer); stdcall;
procedure DataFileR(FileName: string; Y, W: integer); stdcall;
procedure DataFileC(FileName: string; Y, W: integer); stdcall;
procedure DataFileS(FileName: string; Y, W: integer); stdcall;
procedure DataFileT(FileName: string; Y1, Y2: integer); stdcall;
// Линейная структура
procedure DataList(NP: integer; X, Y: integer); stdcall;
// Бинарное дерево
procedure DataBinTree(NP: integer; X, Y1, Y2: integer); stdcall;
// Дерево общего вида
procedure DataTree(NP: integer; X, Y1, Y2: integer); stdcall;

// Добавление элементов к результирующим данным
// Логического
procedure ResultB(Cmt: string; B: integer; X, Y: integer); stdcall;
// Целочисленного
procedure ResultN(Cmt: string; N: integer; X, Y, W: integer); stdcall;
procedure ResultN2(Cmt: string; N1, N2: integer; X, Y, W: integer); stdcall;
procedure ResultN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); stdcall;
// Вещественного
procedure ResultR(Cmt: string; R: real; X, Y, W: integer); stdcall;
procedure ResultR2(Cmt: string; R1, R2: real; X, Y, W: integer); stdcall;
procedure ResultR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); stdcall;
// Символьного
procedure ResultC(Cmt: string; C: char; X, Y: integer); stdcall;
//Строкового
procedure ResultS(Cmt: string; S: string; X, Y: integer); stdcall;
// Узел (PNode)
procedure ResultP(Cmt: string; NP: integer; X, Y: integer); stdcall;
// Просто комментарий
procedure ResultComment(Cmt: string; X, Y: integer); stdcall;
// Файлы
procedure ResultFileN(FileName: string; Y, W: integer); stdcall;
procedure ResultFileR(FileName: string; Y, W: integer); stdcall;
procedure ResultFileC(FileName: string; Y, W: integer); stdcall;
procedure ResultFileS(FileName: string; Y, W: integer); stdcall;
procedure ResultFileT(FileName: string; Y1, Y2: integer); stdcall;
// Линейная структура
procedure ResultList(NP: integer; X, Y: integer); stdcall;
// Бинарное дерево
procedure ResultBinTree(NP: integer; X, Y1, Y2: integer); stdcall;
// Дерево общего вида
procedure ResultTree(NP: integer; X, Y1, Y2: integer); stdcall;

// Вспомогательные
// Число знаков в дробных числах при выводе
procedure SetPrecision(N: integer); stdcall;

// Минимальное число исходных данных
procedure SetRequiredDataCount(N: integer); stdcall;

// Количество тестов в задании
procedure SetTestCount(N: integer); stdcall;

// Горизонтальная координата элемента I из набора N элементов ширины W
function Center(I, N, W, B: integer): integer; stdcall;

// Случайные числа
function RandomN(M, N: integer): integer; stdcall;
function RandomR(A, B: real): real; stdcall;

// Номер текущего теста
function CurrentTest: integer; stdcall;

// Связать NP (номер) и P (узел)
procedure SetPointer(NP: integer; P: PNode); stdcall;

// Отображает в текущей динамической структуре указатель с номером NP
procedure ShowPointer(NP: integer); stdcall;

// Помечает в текущей результирующей динамической структуре указатель, требующий создания
procedure SetNewNode(NNode: integer); stdcall;

// Помечает в текущей исходной динамической структуре указатель, требующий удаления
procedure SetDisposedNode(NNode: integer); stdcall;

// Образцы текста
// Количество слов
function WordCount: integer; stdcall;
function EnWordCount: integer; stdcall;

// Количество предложений
function SentenceCount: integer; stdcall;
function EnSentenceCount: integer; stdcall;

// Количество текстов
function TextCount: integer; stdcall;
function EnTextCount: integer; stdcall;

// Слово-образец по номеру (нумерация от 0)
function WordSample(N: integer): string; stdcall;
function EnWordSample(N: integer): string; stdcall;

// Предложение-образец
function SentenceSample(N: integer): string; stdcall;
function EnSentenceSample(N: integer): string; stdcall;

// Текст-образец
function TextSample(N: integer): string; stdcall;
function EnTextSample(N: integer): string; stdcall;

// Добавляет комментарий к группе заданий
procedure CommentText(S: string); stdcall;
// Использовать комментарий из другой группы/подгруппы
procedure UseComment(GroupName, SubgroupName: string); stdcall;
// Устанавливает режим добавления комментария к группе заданий
procedure Subgroup(SubgroupName: string); stdcall;

// Устанавливает текущий процесс задачника
procedure SetProcess(ProcessRank: integer); stdcall;
// Объектный стиль вывода данных
procedure SetObjectStyle; stdcall;

implementation

var
  InitTask : TInitTaskProc;

procedure RunTask(N : integer);
begin
  InitTask(N);
end;

procedure CreateGroup(GroupName, GroupDesc, GroupAuthor, GroupKey: string;
  TaskCount: integer; InitTaskProc: TInitTaskProc); stdcall;
begin
  // TODO!
  writeln('#CreateGroup: ',
          AnsiToUTF8(Groupname), ' ',
          AnsiToUTF8(GroupDesc), ' ',
          AnsiToUTF8(GroupAuthor),
          ' ', GroupKey);
  InitTask := InitTaskProc;
end;

// Добавляет к группе задания другой группы
procedure UseTask(GroupName: string; TaskNumber: integer); stdcall;
begin
  // TODO!
  writeln('#UseTask: ',
          AnsiToUTF8(GroupName), ' ', TaskNumber);
end;

// Создает задание
procedure CreateTask(SubgroupName: string); stdcall;
begin
  // TODO!
  writeln('#CreateTask: ', AnsiToUTF8(SubgroupName));
end;

procedure CreateTask2(SubgroupName: string; var N : integer); stdcall;
begin
  // TODO!
  writeln('#CreateTask2: ', AnsiToUTF8(SubgroupName), N);
end;

// Возвращает код текущего языка
function CurrentLanguage: integer; stdcall;
begin
  CurrentLanguage := GetLocaleID;
end;

// Возвращает локаль 'ru'/'en'
function CurrentLocale: string; stdcall;
begin
  if GetLocaleID = $419 then
    CurrentLocale := 'ru'
  else
    CurrentLocale := 'en';
end;

// Версия задачника '4.11'
function CurrentVersion: string; stdcall;
begin
  CurrentVersion := '4.11';
end;

// Добавляет строку к заданию
procedure TaskText(S: string; X, Y: integer); stdcall;
begin
  // TODO!
  writeln('#TaskText: ', AnsiToUTF8(S), ' [', X, '-', Y, ']');
end;

// Добавляет комментарий к группе заданий
procedure CommentText(S: string); stdcall;
begin
  // TODO!
  //writeln('#CommentText:', AnsiToUTF8(S));
end;

// Использовать комментарий из другой группы/подгруппы
procedure UseComment(GroupName, SubgroupName: string); stdcall;
begin
  // TODO!
  writeln('#UseComment: ', AnsiToUTF8(GroupName), AnsiToUTF8(SubgroupName));
end;

// Устанавливает режим добавления комментария к группе заданий
procedure Subgroup(SubgroupName: string); stdcall;
begin
  // TODO!
  //writeln('#Subgroup: ', AnsiToUTF8(SubgroupName));
end;

// Устанавливает текущий процесс задачника
procedure SetProcess(ProcessRank: integer); stdcall;
begin
  // TODO!
end;

// Объектный стиль вывода данных
procedure SetObjectStyle; stdcall;
begin
  // TODO!
end;

// Добавление элементов к исходным данным
// Логического
procedure DataB(Cmt: string; B: integer; X, Y: integer); stdcall;
var
  Q : boolean;
begin
  // FIXME
  Q := B=1;
  AddToData(Q, TBool);
end;

// Целочисленного
procedure DataN(Cmt: string; N: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(N, TInt);
end;

procedure DataN2(Cmt: string; N1, N2: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(N1, TInt);
  AddToData(N2, TInt);
end;

procedure DataN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(N1, TInt);
  AddToData(N2, TInt);
  AddToData(N3, TInt);
end;

// Вещественного
procedure DataR(Cmt: string; R: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(R, TReal);
end;

procedure DataR2(Cmt: string; R1, R2: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(R1, TReal);
  AddToData(R2, TReal);
end;

procedure DataR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToData(R1, TReal);
  AddToData(R2, TReal);
  AddToData(R3, TReal);
end;

// Символьного
procedure DataC(Cmt: string; C: char; X, Y: integer); stdcall;
begin
  // FIXME
  AddToData(C, TChar);
end;

//Строкового
procedure DataS(Cmt: string; S: string; X, Y: integer); stdcall;
var
  Q : PChar;
begin
  // FIXME
  Q := PChar(S);
  AddToData(Q, TPChar);
end;

// Узел (PNode)
procedure DataP(Cmt: string; NP: integer; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Просто комментарий
procedure DataComment(Cmt: string; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Файлы
procedure DataFileN(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure DataFileR(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure DataFileC(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure DataFileS(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure DataFileT(FileName: string; Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Линейная структура
procedure DataList(NP: integer; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Бинарное дерево
procedure DataBinTree(NP: integer; X, Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Дерево общего вида
procedure DataTree(NP: integer; X, Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Добавление элементов к результирующим данным
// Логического
procedure ResultB(Cmt: string; B: integer; X, Y: integer); stdcall;
var
  Q : boolean;
begin
  // FIXME
  Q := B=1;
  AddToResult(Q, TBool);
end;

// Целочисленного
procedure ResultN(Cmt: string; N: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(N, TInt);
end;

procedure ResultN2(Cmt: string; N1, N2: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(N1, TInt);
  AddToResult(N2, TInt);
end;

procedure ResultN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(N1, TInt);
  AddToResult(N2, TInt);
  AddToResult(N3, TInt);
end;

// Вещественного
procedure ResultR(Cmt: string; R: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(R, TReal);
end;

procedure ResultR2(Cmt: string; R1, R2: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(R1, TReal);
  AddToResult(R2, TReal);
end;

procedure ResultR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); stdcall;
begin
  // FIXME
  AddToResult(R1, TReal);
  AddToResult(R2, TReal);
  AddToResult(R3, TReal);
end;

// Символьного
procedure ResultC(Cmt: string; C: char; X, Y: integer); stdcall;
begin
  // FIXME
  AddToResult(C, TChar);
end;

//Строкового
procedure ResultS(Cmt: string; S: string; X, Y: integer); stdcall;
var
  Q : PChar;
begin
  // FIXME
  Q := PChar(S);
  AddToResult(Q, TPChar);
end;

// Узел (PNode)
procedure ResultP(Cmt: string; NP: integer; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Просто комментарий
procedure ResultComment(Cmt: string; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Файлы
procedure ResultFileN(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure ResultFileR(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure ResultFileC(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure ResultFileS(FileName: string; Y, W: integer); stdcall;
begin
  // TODO!
end;

procedure ResultFileT(FileName: string; Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Линейная структура
procedure ResultList(NP: integer; X, Y: integer); stdcall;
begin
  // TODO!
end;

// Бинарное дерево
procedure ResultBinTree(NP: integer; X, Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Дерево общего вида
procedure ResultTree(NP: integer; X, Y1, Y2: integer); stdcall;
begin
  // TODO!
end;

// Вспомогательные
// Число знаков в дробных числах при выводе
procedure SetPrecision(N: integer); stdcall;
begin
  // TODO!
end;

// Минимальное число исходных данных
procedure SetRequiredDataCount(N: integer); stdcall;
begin
  // TODO!
  writeln('#SetRequiredDataCount: ', N);
end;

// Количество тестов в задании
procedure SetTestCount(N: integer); stdcall;
begin
  // TODO!
  writeln('#SetTestCount: ', N);
end;

// Горизонтальная координата элемента I из набора N элементов ширины W
function Center(I, N, W, B: integer): integer; stdcall;
begin
  // TODO!
end;

// Случайные числа
function RandomN(M, N: integer): integer; stdcall;
begin
  RandomN := M + Random(N-M);
end;

function RandomR(A, B: real): real; stdcall;
begin
  RandomR := A + Random*(B-A);
end;

// Номер текущего теста
function CurrentTest: integer; stdcall;
begin
  // TODO!
  CurrentTest := 0;
end;

// Связать NP (номер) и P (узел)
procedure SetPointer(NP: integer; P: PNode); stdcall;
begin
  // TODO!
end;

// Отображает в текущей динамической структуре указатель с номером NP
procedure ShowPointer(NP: integer); stdcall;
begin
  // TODO!
end;

// Помечает в текущей результирующей динамической структуре указатель, требующий создания
procedure SetNewNode(NNode: integer); stdcall;
begin
  // TODO!
end;

// Помечает в текущей исходной динамической структуре указатель, требующий удаления
procedure SetDisposedNode(NNode: integer); stdcall;
begin
  // TODO!
end;

// Образцы текста
// Количество слов
function WordCount: integer; stdcall;
begin
  WordCount := RuNumWords;
end;

function EnWordCount: integer; stdcall;
begin
  EnWordCount := EnNumWords;
end;

// Количество предложений
function SentenceCount: integer; stdcall;
begin
  SentenceCount := RuNumSent;
end;

function EnSentenceCount: integer; stdcall;
begin
  EnSentenceCount := EnNumSent;
end;

// Количество текстов
function TextCount: integer; stdcall;
begin
  TextCount := RuNumText;
end;

function EnTextCount: integer; stdcall;
begin
  EnTextCount := EnNumText;
end;

// Слово-образец по номеру (нумерация от 0)
function WordSample(N: integer): string; stdcall;
begin
  WordSample := RuGetWord(N);
end;

function EnWordSample(N: integer): string; stdcall;
begin
  EnWordSample := EnGetWord(N);
end;

// Предложение-образец
function SentenceSample(N: integer): string; stdcall;
begin
  //writeln('N = ', N);
  //SentenceSample := RuGetSentence(N);
  inc(N);
end;

function EnSentenceSample(N: integer): string; stdcall;
begin
  EnSentenceSample := EnGetSentence(N);
end;

// Текст-образец
function TextSample(N: integer): string; stdcall;
begin
  TextSample := RuGetText(N);
end;

function EnTextSample(N: integer): string; stdcall;
begin
  EnTextSample := EnGetText(N);
end;

end.

