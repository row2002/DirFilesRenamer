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
    i, filesCount: integer;
    files: array of string;
begin
  directory := DirTF.Text + '\';
  prefix := PrefixTF.Text;
  filesCount := 0;

  if (Length(directory) = 0) then begin
    ShowMessage('Выберите директорию!');
  end else if (Length(prefix) = 0) then begin
    ShowMessage('Укажите префикс для названия файлов!');
  end else begin
    if FindFirst(directory + '*.*', faAnyFile, SR) = 0 then begin
      repeat
        if (SR.Attr <> faDirectory) then begin
          if (SR.Name <> '.') and (SR.Name <> '..') then begin
            filesCount := filesCount + 1;
            SetLength(files, filesCount);
            files[filesCount-1] := SR.name;
          end;
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;

   for i:=0 to filesCount-1 do begin
      newFileName := directory + prefix + IntToStr(i+1) + ExtractFileExt(files[i]);
      RenameFile(directory+files[i], newFileName);
    end;
    ShowMessage('Переимнование завершено!');
  end;
end;

end.
