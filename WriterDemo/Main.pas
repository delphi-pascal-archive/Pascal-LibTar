(**
===============================================================================================
Name    : Main
===============================================================================================
Project : "TarMaker" Demo Application for LibTar.pas
===============================================================================================
Subject : Main Window
===============================================================================================
Date        Author Changes
-----------------------------------------------------------------------------------------------
2001-06-19  HeySt  Start
*)

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,
  LibTar;

type
  TFrmMain = class(TForm)
    LblTar: TLabel;
    EdtTarFilename: TEdit;
    BtnTar: TButton;
    BtnAdd: TButton;
    BtnCreateTar: TButton;
    BtnFinalize: TButton;
    Label3: TLabel;
    DlgTar: TSaveDialog;
    DlgFile: TOpenDialog;
    LblStatus: TStaticText;
    procedure BtnTarClick(Sender: TObject);
    procedure BtnCreateTarClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFinalizeClick(Sender: TObject);
  private
  public
    FTarWriter : TTarWriter;
  end;

var
  FrmMain: TFrmMain;

(*
===============================================================================================
IMPLEMENTATION
===============================================================================================
*)

IMPLEMENTATION

{$R *.DFM}

procedure TFrmMain.BtnTarClick(Sender: TObject);
begin
  DlgTar.Filename := EdtTarFilename.Text;
  IF DlgTar.Execute THEN
    EdtTarFilename.Text := DlgTar.Filename;
end;

procedure TFrmMain.BtnCreateTarClick(Sender: TObject);
begin
  IF EdtTarFilename.Text = '' THEN BEGIN
    ShowMessage ('Please enter the tar file''s name first');
    EXIT;
    END;
  FreeAndNil (FTarWriter);
  FTarWriter := TTarWriter.Create (EdtTarFilename.Text);

  LblTar.Enabled := FALSE;
  EdtTarFilename.Enabled := FALSE;
  BtnTar.Enabled := FALSE;
  BtnCreateTar.Enabled := FALSE;
  BtnAdd.Enabled := TRUE;
  BtnFinalize.Enabled := TRUE;
end;

procedure TFrmMain.FormHide(Sender: TObject);
begin
  FreeAndNil (FTarWriter);
end;

procedure TFrmMain.BtnAddClick(Sender: TObject);
begin
  IF Not Assigned (FTarWriter) THEN BEGIN
    ShowMessage ('Please create tar file first.');
    EXIT;
    END;
  IF NOT DlgFile.Execute THEN EXIT;

  LblStatus.Caption := 'Adding file ...';
  TRY
    FTarWriter.AddFile (DlgFile.Filename);
  FINALLY
    LblStatus.Caption := '';
    END;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  BtnAdd.Enabled := FALSE;
  BtnFinalize.Enabled := FALSE;
end;

procedure TFrmMain.BtnFinalizeClick(Sender: TObject);
begin
  // FTarWriter.Finalize;   You don't have to do this because .Free does it for you
  FreeAndNil (FTarWriter);
  Close;
end;

end.
