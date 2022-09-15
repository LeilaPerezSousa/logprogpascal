unit exemplo07;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BPressao: TButton;
    BLimpar: TButton;
    BSair: TButton;
    EAr: TEdit;
    EAltura: TEdit;
    EPressao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RgTipo: TRadioGroup;
    procedure BLimparClick(Sender: TObject);
    procedure BPressaoClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BPressaoClick(Sender: TObject);
var
  tg: integer;
  Q, hg, Pg: double;
  a, b : double;
begin
  Q:= StrToFloat (EAr.Text);
  hg:= StrToFloat (EAltura.Text);
  tg:= RgTipo.ItemIndex;
  CASE tg of
       0: begin
         a:= 0.722; b:= 0.197;   //arroz
         end;
       1: begin
         a:= 0.583; b:= 0.512; //milho
         end;
       2: begin
         a:= 0.333; b:= 0.302; //soja
         end;
       3: begin
         a:= 0.825; b:= 0.164; //trigo
         end;

  end;
  Pg:= (a*sqr(Q) *hg) /ln (1+b *Q);
  EPressao.Text:= FloatToStr(Pg);
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
   close;
end;

procedure TForm1.BLimparClick(Sender: TObject);
begin
  EAr.Text:= '';
  EAltura.Text:= '';
  EPressao.Text:= '';
end;


end.

