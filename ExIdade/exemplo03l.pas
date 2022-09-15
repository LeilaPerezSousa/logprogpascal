unit Exemplo03l;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
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
  nasc, atual, idade: integer;
begin
  //recuperação
  nasc:= StrToInt (Edit1.text);
  atual:= STrToInt (Edit2.text);

  //processamento
  idade:= atual - nasc;

  //saida
  Edit3.text := IntToStr (idade);

end;

end.

