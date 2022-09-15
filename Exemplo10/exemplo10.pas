unit exemplo10;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BPotencia: TButton;
    BSair: TButton;
    EVazao: TEdit;
    EAltura: TEdit;
    EDiametro: TEdit;
    ERendimento: TEdit;
    EPotencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgTipo: TRadioGroup;
    procedure BPotenciaClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.rgTipoClick(Sender: TObject);
begin

end;

procedure TForm1.BPotenciaClick(Sender: TObject);
var
  tg: integer;
  Q, Qa, hg, Pg, Pgm, Ds, Area, Pot, rv: double;
  a, b: array [0..3] of double;
begin
  a[0]:= 0.772;
  a[1]:= 0.583;
  a[2]:= 0.333;
  a[3]:= 0.825;

   a[0]:= 0.197;
   a[1]:= 0.512;
   a[2]:= 0.302;
   a[3]:= 0.164;

   //entrada de dados
   Q:= StrToFloat (EVazao.Text);
   hg:= StrToFloat (EAltura.Text);
   Ds:= StrToFloat (EDiametro.Text);
   rv:= StrToFloat (ERendimento.Text);
   tg:= rgTipo.ItemIndex;

   //processamento

   Area:= pi*sqr(Ds)/4*hg;
   Qa:= Q/Area;
   Pgm:= (sqr(Qa)*a[tg])/ (Ln(1+b[tg]*Qa));
   Pg:= Pgm * hg;
   Pot:= (Q*1.2*Pgm) /(rv);

   //Saida
   EPotencia.Text := FloatToStr(Pot);

end;

procedure TForm1.BSairClick(Sender: TObject);
begin
  close;
end;

end.

