library PT4pabc;

{$mode objfpc}{$H+}

uses
  Classes, Forms, Interfaces, PT4ProgIFace, pt4loadu, PT4LibIFace, PT4Common,
  PT4Data, PT4WordBase;

exports
  // PT4ProgIFace
  StartPT name 'startpt',
  Task name 'task',
  FreePT name 'freept',
  CheckPTF name 'checkptf',
  GetR name 'getr',
  PutR name 'putr',
  GetN name 'getn',
  PutN name 'putn',
  GetB name 'getb',
  PutB name 'putb',
  GetS name 'gets',
  PutS name 'puts',

  // PT4LibIFace
  CreateGroup name 'creategroup',
  UseTask name 'usetask',
  CreateTask name 'createtask',
  CreateTask2 name 'createtask2',
  CurrentLanguage name 'currentlanguage',
  CurrentLocale name 'currentlocale',
  CurrentVersion name 'currentversion',
  TaskText name 'tasktext',
  DataB name 'datab',
  DataN name 'datan',
  DataN2 name 'datan2',
  DataN3 name 'datan3',
  DataR name 'datar',
  DataR2 name 'datar2',
  DataR3 name 'datar3',
  DataC name 'datac',
  DataS name 'datas',
  DataP name 'datap',
  DataComment name 'datacomment',
  DataFileN name 'datafilen',
  DataFileR name 'datafiler',
  DataFileC name 'datafilec',
  DataFileS name 'datafiles',
  DataFileT name 'datafilet',
  DataList name 'datalist',
  DataBinTree name 'databintree',
  DataTree name 'datatree',

  ResultB name 'resultb',
  ResultN name 'resultn',
  ResultN2 name 'resultn2',
  ResultN3 name 'resultn3',
  ResultR name 'resultr',
  ResultR2 name 'resultr2',
  ResultR3 name 'resultr3',
  ResultC name 'resultc',
  ResultS name 'results',
  ResultP name 'resultp',
  ResultComment name 'resultcomment',
  ResultFileN name 'resultfilen',
  ResultFileR name 'resultfiler',
  ResultFileC name 'resultfilec',
  ResultFileS name 'resultfiles',
  ResultFileT name 'resultfilet',
  ResultList name 'resultlist',
  ResultBinTree name 'resultbintree',
  ResultTree name 'resulttree',

  SetPrecision name 'setprecision',
  SetRequiredDataCount name 'setrequireddatacount',
  SetTestCount name 'settestcount',
  Center name 'center',
  RandomN name 'randomn',
  RandomR name 'randomr',
  CurrentTest name 'curt',
  SetPointer name 'setpointer',
  ShowPointer name 'showpointer',
  SetNewNode name 'setnewnode',
  SetDisposedNode name 'setdisposednode',
  WordCount name 'wordcount',
  SentenceCount name 'sentencecount',
  TextCount name 'textcount',
  WordSample name 'wordsample',
  SentenceSample name 'sentencesample',
  TextSample name 'textsample',
  CommentText name 'commenttext',
  UseComment name 'usecomment',
  Subgroup name 'subgroup',
  SetProcess name 'setprocess',
  SetObjectStyle name 'setobjectstyle',

  // PT4LoadU
  pt4load,
  pt4getdatinfo;

end.

