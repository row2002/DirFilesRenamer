unit BaseUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TMainForm = class(TForm)
    GoBtn: TButton;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    DirTF: TEdit;
    SelectDirBtn: TButton;
    Label2: TLabel;
    PrefixTF: TEdit;
    procedure SelectDirBtnClick(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function StrCmpLogicalW(P1, P2: PWideChar): Integer;  stdcall; external 'Shlwapi.dll';

function CompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := StrCmpLogicalW(PWideChar(WideString(List[Index1])), PWideChar(WideString(List[Index2])));
end;

procedure TMainForm.SelectDirBtnClick(Sender: TObject);
var directory: string;
begin
  if (SelectDirectory('Выберите директорию', '', directory)) then begin
    DirTF.Text := directory;
    PrefixTF.SetFocus();
    GoBtn.Enabled := true;
  end;
end;

procedure TMainForm.GoBtnClick(Sender: TObject);
var directory, prefix, newFileName: string;
    SR: TSearchRec;
    SL: TStringList;
    i: integer;
begin
  directory := DirTF.Text + '\';
  prefix := PrefixTF.Text;

  if (Length(directory) = 0) then begin
    ShowMessage('Выберите директорию!');
  end else if (Length(prefix) = 0) then begin
    ShowMessage('Укажите префикс для названия файлов!');
  end else begin
    SL := TStringList.Create;

    try
      if FindFirst(directory + '*.*', faAnyFile and not faDirectory and not faHidden, SR) = 0 then begin
        repeat
          if (SR.Name <> '.') and (SR.Name <> '..') then begin
            SL.Add(SR.Name);
          end;
        until FindNext(SR) <> 0;
        FindClose(SR);
      end;

      SL.CustomSort(CompareStrings);

      for i:=0 to SL.Count-1 do begin
        newFileName := directory + prefix + IntToStr(i+1) + ExtractFileExt(SL[i]);
        RenameFile(directory + SL[i], newFileName);
      end;

    finally
      SL.Clear;
      SL.Free;
    end;

    ShowMessage('Переимнование завершено!');
  end;
end;

end.
