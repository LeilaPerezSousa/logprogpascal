unit ex05;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BDigitar: TButton;
    BLimpar: TButton;
    BSair: TButton;
    ENumNotas: TEdit;
    EMedia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BDigitarClick(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BDigitarClick(Sender: TObject);
const
     sentinela= -1;
     var S_nota: string;
       nnotas, nota, soma, media: double;
begin
  nnotas:= 0;
  soma:= 0;

  //Ler a primeira nota
  s_nota:= InputBox ('Digite a nota ou -1 para terminar.' ,'NOTA', '');
  nota:= StrToFloat (s_nota);
  if nota <> sentinela
  then
      begin
        while nota <>SENTINELA do
              begin
                nnotas:= nnotas +1;
                soma:= soma+nota;
                //Ler as seguintes notas
                s_nota:= InputBox ('Digite a nota ou -1 para terminar.', 'NOTA', '');
                nota:= StrToFloat(s_nota);
              end;
              media:= soma/nnotas;
              ENumNotas.Text:= (FloatToStr(nnotas));
              EMedia.Text:=(FloatToStr(media));
      end
      else close; //se a primeira nota digitada for -1 ==> o programa é fechado

end;

procedure TForm1.BLimparClick(Sender: TObject);
begin
  ENumNotas.Text:= '0';
  EMedia.Text:= '0';
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
  close;
end;
end.

