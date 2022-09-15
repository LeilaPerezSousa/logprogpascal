unit ex09;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    BCalcular: TButton;
    BLimpar: TButton;
    BSair: TButton;
    Chart1: TChart;
    FlineB: TLineSeries;
    Fline: TLineSeries;
    EPopA: TEdit;
    EPopB: TEdit;
    ETaxaA: TEdit;
    ETaxaB: TEdit;
    ETempo: TEdit;
    EPopFinalA: TEdit;
    EPopFinalB: TEdit;
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
    procedure InitLine;
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
  tempo, tempografico: integer;
begin
    FreeAndNil (FLine);
    FreeAndNil (FLineB);
    InitLine;

    //entrada
    popiA:= StrToFloat (EPopA.Text);
    popiB:= StrToFloat (EPopB.Text);
    taxaA:= StrToFloat (ETaxaA.Text);
    taxaA:= StrToFloat (ETaxaB.Text);

    //processamento
    taxaA:= taxaA/100+1;
    taxaB:= taxaB/100+1;
    tempo:= 0;
    popA:= popiA;
    popB:= popiB;

    while (popA<= popB) do
    begin
      Fline.AddXY(tempo,popA, '', clGreen);
      FlineB.AddXY(tempo,popB, '', clGreen);

      popA:= popA* taxaA;
      popB:= popB * taxaB;
      tempo:= tempo+1;
    end;
    tempografico:= Round(tempo*1.4);

    //saida
    ETempo.Text:= IntToStr (tempo);
    EPopFinalA.Text:= FloatToStr(popA);
    EPopFinalB.Text:= FloatToStr(popB);

    while (tempo <= tempografico) do
    begin
      tempo:= tempo+1;
      popA:= popA * taxaA;
      popB:= popB* taxaB;

      Fline.AddXY (tempo, popA, '', clGreen);
      FlineB.AddXY (tempo, popB, '', clGreen);
    end;
end;

procedure TForm1.BLimparClick(Sender: TObject);
begin
  EPopA.Text:='0';
  EPopB.Text:='0';
  ETaxaA.Text:='0';
  ETaxaB.Text:='0';
  ETempo.Text:='0';
  EPopFinalA.Text:='0';
  EPopFinalB.Text:='0';
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.InitLine;
begin
  Fline:= TLineSeries.Create(Chart1);
  Fline.ShowLines:= true;
  Fline.showPoints:= False;
  Fline.Pointer.Brush.Color:= clBlue;
  Fline.Title:= 'Pop. A';
  Fline.SeriesColor:= clRed;
  Chart1.AddSeries(Fline);

  FlineB:= TLineSeries.Create(Chart1);
  FlineB.ShowLines:= true;
  FlineB.showPoints:= False;
  FlineB.Pointer.Brush.Color:= clGreen;
  FlineB.Title:= 'Pop. B';
  FlineB.SeriesColor:= clGreen;
  Chart1.AddSeries(FlineB);

  Chart1.Legend.Visible:= True;

end;

end.

