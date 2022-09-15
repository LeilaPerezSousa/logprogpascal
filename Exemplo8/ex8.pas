unit ex8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BCalcular: TButton;
    BLimpar: TButton;
    BSair: TButton;
    ECrescA: TEdit;
    ECrescB: TEdit;
    EPopFinalB: TEdit;
    EPopFinalA: TEdit;
    EPopB: TEdit;
    EPopA: TEdit;
    ETempo: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BCalcularClick(Sender: TObject);
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

procedure TForm1.BCalcularClick(Sender: TObject);
var
  popiA, popiB, popA, popB, taxaA, taxaB: double;
  tempo: integer;
begin
  //taxa
  popiA:= StrToFloat (EPopA.Text);
  taxaA:= StrToFloat (ECrescA.Text);
  popiB:= StrToFloat (EPopB.Text);
  taxaB:= StrToFloat (ECrescB.Text);

  //processamento
  taxaA:= taxaA/100 +1;
  taxaB:= taxaB/100 +1;
  tempo:= 0;
  popA:= popiA;
  popB:= popiB;
  while (popiA<=popiB) do
        begin
          popiA:= popiA * taxaA;
          popiB:= popiB *taxaB;
          tempo:= tempo + 1;
        end;
  ETempo.Text:= IntToStr (tempo);
  EPopA.Text:= FloatToStr(popA);
  EPopB.Text:= FloatToStr(popB);
end;

procedure TForm1.BLimparClick(Sender: TObject);
begin
  EPopA.Text:= '';
  EPopB.Text:= '';
  ECrescA.Text:= '';
  ECrescB.Text:= '';
  ETempo.Text:= '';
  EPopFinalA.Text:= '';
  EPopFinalB.Text:= '';
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
  close;
end;




end.

