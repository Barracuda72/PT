object PTULoadForm1: TPTULoadForm1
  Left = 484
  Height = 150
  Top = 283
  Width = 441
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 150
  ClientWidth = 441
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Icon.Data = {
    FE0200000000010001002020100000000000E802000016000000280000002000
    0000400000000100040000000000800200000000000000000000000000000000
    000000000000000080000080000000808000800000008000800080800000C0C0
    C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
    FF00000000000000000000000000000000000000000000080000000000000000
    00000000000000880077777777777777700000000000088800FFFFFFFFFFFFFF
    700000000000888800F00000000000FF700000000008888800FFF000FFFF00FF
    700000000088888800FFF000FFFFF0FF700000000888888800FFF000FFFFF0FF
    700000008888888800FFF000FFFFFFFF700000088888888800FFF000FFFFFFFF
    700000888888888807FFF000FFFFFFFF7000007FFFFFFFFFFFFFF000FFFFFFFF
    7000007FF77777777FFFF000FFFFFFFF7000007FFFFFFFFFFFFFF000FFFFFFFF
    7000007FF77777777FFFF000FFFFFFFF7000007FFFFFFFFFFFF0000000FFFFFF
    7000007FF77777777FFFFFFFFFFFFFFF7000007FFFFFFFFFFFFFFFFFFFFFFFFF
    7000007FF000FFF000FFF777777777FF7000007FFF0FFFFF0FFFFFFFFFFFFFFF
    7000007FFF000FFF0FFFF777777777FF7000007FFF0F0F0F0F0FFFFFFFFFFFFF
    7000007FF0000F00000FF777777777FF7000007FFFFFFFFFFFFFFFFFFFFFFFFF
    7000007FFFFFFFFFFFFFFFFFFFFFFFFF70000078888888888888888888888888
    7000007888888888888888888888888870000078888888888888888888888888
    7000007888888888888888888888888870000078888888888888888888888888
    7000007777777777777777777777777777000000000000000000000000000000
    0000FFFFFFFFFFE00003FFC00003FF800003FF000003FE000003FC000003F800
    0003F0000003E0000003C0000003C0000003C0000003C0000003C0000003C000
    0003C0000003C0000003C0000003C0000003C0000003C0000003C0000003C000
    0003C0000003C0000003C0000003C0000003C0000003C0000003C0000003FFFF
    FFFF
  }
  KeyPreview = True
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  LCLVersion = '1.0.14.0'
  object Label2: TLabel
    Left = 9
    Height = 1
    Top = 17
    Width = 1
    FocusControl = Edit1
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Height = 1
    Top = 48
    Width = 1
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Height = 71
    Top = 4
    Width = 292
  end
  object Bevel2: TBevel
    Left = 0
    Height = 70
    Top = 80
    Width = 441
  end
  object StaticText1: TLabel
    Left = 8
    Height = 43
    Top = 86
    Width = 409
    AutoSize = False
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 330
    Height = 24
    Top = 12
    Width = 75
    Caption = 'Загрузить'
    Default = True
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    OnClick = Button1Click
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 330
    Height = 24
    Top = 43
    Width = 75
    Cancel = True
    Caption = 'Отмена'
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ModalResult = 2
    OnClick = Button2Click
    ParentFont = False
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 72
    Height = 21
    Top = 14
    Width = 177
    AutoSize = False
    AutoSelect = False
    TabOrder = 0
    Text = '1'
  end
  object Edit2: TStaticText
    Left = 72
    Height = 17
    Top = 47
    Width = 177
    BorderStyle = sbsSunken
    Caption = 'C:\PABCWork.NET'
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ParentFont = False
    TabOrder = 4
  end
  object Button3: TBitBtn
    Left = 257
    Height = 24
    Top = 43
    Width = 24
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777777777777777777777777777777700000000000
      00077FFFFFFFFFFFFFF77F3333333333330778888888888888F77FB3B3B3B3B3
      B30778F77777777778F77F3B3B3B3B3B330778F77777777778F77FB3B3B3B3B3
      B30778F77777777778F77F3B3B3B3B3B330778F77777777778F77FB3B3B3B3B3
      B30778F77777777778F77F3B3B3B3B3B330778F77777FFFFF8F77FFFFFFFFFFF
      F70778F7777F888888F777FBBBBB77777777778FFFF877777777777FFFF77777
      7777777888877777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777
    }
    NumGlyphs = 2
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 8
    Height = 17
    Top = 130
    Width = 425
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object UpDown1: TUpDown
    Left = 420
    Height = 27
    Top = 93
    Width = 16
    Min = 1
    Position = 1
    TabOrder = 5
    Visible = False
    Wrap = False
  end
  object Label1: TLabel
    Left = 9
    Height = 18
    Top = 16
    Width = 64
    AutoSize = False
    Caption = 'Задание:'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 9
    Height = 14
    Top = 47
    Width = 45
    Caption = 'Каталог:'
    ParentColor = False
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.dpr'
    Filter = '|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofFileMustExist]
    left = 16
    top = 96
  end
  object PopupMenu1: TPopupMenu
    left = 96
    top = 96
    object MenuItem1: TMenuItem
      Caption = 'New Item1'
    end
  end
end
