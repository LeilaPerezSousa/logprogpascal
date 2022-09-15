unit ex3;

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
    ESalAntigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MNovoSal: TMemo;
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
  nsal, sal: double;
begin
  sal:= StrToFloat (ESalAntigo.Text);
  if sal<500
     then nsal:= sal*1.15
     else
       if sal<=1000
          then nsal := sal*1.10
          else nsal:= sal*1.05;
  MNovoSal.Lines.Add ('Novo salário (R$) : '+ FloatToStr (nsal));

end;

procedure TForm1.BLimparClick(Sender: TObject);
begin
  ESalAntigo.Text:= ' ';
  MNovoSal.Lines.Clear;
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
  close;
end;

end.

