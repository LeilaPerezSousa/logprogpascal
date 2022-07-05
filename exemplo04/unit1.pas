unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);
var
  F, C : double;
begin
  //recuperação
  C:= StrToFloat (Edit1.text);

  //processamento
  F:= 1.8*C+32;

  //saida
  Edit2.text:= FloatToStr (F);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  F, C : double;
begin
  //recuperação
  F:= StrToFloat (Edit2.text);

  //processamento
  C:= 5/9*(F-32);

  //saida
  Edit1.text:= FloatToStr(C);

end;

end.

