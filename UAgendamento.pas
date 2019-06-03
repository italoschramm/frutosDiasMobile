unit UAgendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.DateTimeCtrls, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr;

type
  Tf_agendamento = class(TForm)
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    ToolBar1: TToolBar;
    Image6: TImage;
    btvoltar: TImage;
    lbtitulo: TLabel;
    TabControl2: TTabControl;
    tbcomprar_carro: TTabItem;
    Layout26: TLayout;
    Layout27: TLayout;
    Layout28: TLayout;
    Label12: TLabel;
    data: TDateEdit;
    Layout29: TLayout;
    Label13: TLabel;
    hora: TTimeEdit;
    Layout30: TLayout;
    Layout32: TLayout;
    btenviar: TButton;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    edplaca: TEdit;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Label5: TLabel;
    memo: TMemo;
    AniIndicator: TAniIndicator;
    SQLConnection1: TSQLConnection;
    Memo1: TMemo;
    procedure btenviarClick(Sender: TObject);
    procedure btvoltarClick(Sender: TObject);
    procedure edplacaEnter(Sender: TObject);
    procedure edplacaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_agendamento: Tf_agendamento;

implementation

{$R *.fmx}

uses UServerClasses, UPrincipal;

var

server : TServerMethods1client;

procedure Tf_agendamento.btenviarClick(Sender: TObject);
var
i : integer;
begin
     //if (dayofweek(strtodate(edit1.text)))=1 then

       i := 0;

       if (dayofweek(data.Date)=7) then
          if (hora.Time >= strtodatetime('08:00:00')) and (hora.Time <= strtodatetime('12:00:00')) then
          i := 1;

       if (dayofweek(data.Date)=6) OR (dayofweek(data.Date)=2) OR (dayofweek(data.Date)=3)
       and (dayofweek(data.Date)=4) OR (dayofweek(data.Date)=5) then
           if (hora.Time >= strtodatetime('07:00:00')) and (hora.Time <= strtodatetime('17:30:00')) then
          i := 1;


       if i = 1 then
       begin

            AniIndicator.Enabled := true;
            AniIndicator.Visible := true;

            TThread.CreateAnonymousThread(
            procedure()
            begin
                try



       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
              f_principal.conectar;
                server := TServerMethods1client.Create(f_principal.SQLConnection1.DBXConnection);
                server.agendamento(f_principal.nome, datetostr(data.date), timetostr(hora.Time), edplaca.Text, f_principal.email, f_principal.telefone, memo.Lines.Text, f_principal.cpf);

                showmessage('Solicitação enviada com sucesso! O atendente entrará em contato!');
                f_agendamento.Close;
                f_agendamento.free;

	            AniIndicator.enabled := false;
	            AniIndicator.visible := false;
       end);


       Except

       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
	           AniIndicator.enabled := false;
	           AniIndicator.visible := false;
       end);


       end;

       end).Start

       end
       else
       showmessage('Devem ser selecionados Dia e Hora de acordo com funcionamento da loja.');
end;

procedure Tf_agendamento.btvoltarClick(Sender: TObject);
begin
     f_agendamento.Close;
      f_agendamento.free;
end;

procedure Tf_agendamento.edplacaEnter(Sender: TObject);
begin
      edplaca.Text := copy(edplaca.Text,1,3) + copy(edplaca.Text,5,4);
end;

procedure Tf_agendamento.edplacaExit(Sender: TObject);
begin
      edplaca.Text := copy(edplaca.Text,1,3) + '-' + copy(edplaca.Text,4,4);
end;

procedure Tf_agendamento.FormCreate(Sender: TObject);
begin
      data.Date := now + 1;
end;

end.
