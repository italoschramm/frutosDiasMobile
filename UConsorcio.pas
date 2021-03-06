unit UConsorcio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Datasnap.DBClient,
  Datasnap.DSConnect, Data.DB, Data.SqlExpr, FMX.StdCtrls, FMX.ListBox,
  FMX.Edit, FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ComboEdit, IdThreadComponent, IdBaseComponent;

type
  Tf_consorcio = class(TForm)
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    ToolBar1: TToolBar;
    Image6: TImage;
    btvoltar: TImage;
    lbtitulo: TLabel;
    TabControl2: TTabControl;
    tbcomprar_carro: TTabItem;
    Layout26: TLayout;
    Layout28: TLayout;
    edvalor: TEdit;
    Label2: TLabel;
    Layout32: TLayout;
    btenviar: TButton;
    Layout1: TLayout;
    Layout3: TLayout;
    Layout5: TLayout;
    lbparcela: TLabel;
    Layout6: TLayout;
    Layout8: TLayout;
    Layout7: TLayout;
    Layout11: TLayout;
    lbcredito: TLabel;
    AniIndicator: TAniIndicator;
    BindingsList1: TBindingsList;
    DSProviderConnection1: TDSProviderConnection;
    Layout10: TLayout;
    lbmodelo: TLabel;
    LinkFillControlToField: TLinkFillControlToField;
    cds_modelos: TClientDataSet;
    cds_modelosIDVEICULO: TAutoIncField;
    cds_modelosMODELO: TStringField;
    cds_modelosVALOR_CREDITO: TFloatField;
    cds_modelosVALOR_PARCELA: TFloatField;
    SQLConnection1: TSQLConnection;
    BindSourceDB1: TBindSourceDB;
    Layout12: TLayout;
    Layout14: TLayout;
    lbobservacao: TLabel;
    Layout29: TLayout;
    Label12: TLabel;
    cbmodelo: TComboBox;
    LinkFillControlToField2: TLinkFillControlToField;
    Layout2: TLayout;
    lblance: TLabel;
    edlance: TEdit;
    Layout4: TLayout;
    btsimular: TButton;
    Layout9: TLayout;
    thread_consorcio: TIdThreadComponent;
    thread_enviar: TIdThreadComponent;
    Layout13: TLayout;
    Layout15: TLayout;
    Layout16: TLayout;
    lbparcelanova: TLabel;
    procedure btvoltarClick(Sender: TObject);
    procedure cbmodeloChange(Sender: TObject);
    procedure edvalorExit(Sender: TObject);
    procedure edvalorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edlanceKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edlanceExit(Sender: TObject);
    procedure btsimularClick(Sender: TObject);
    procedure btenviarClick(Sender: TObject);
    procedure thread_consorcioRun(Sender: TIdThreadComponent);
    procedure thread_enviarRun(Sender: TIdThreadComponent);
    procedure thread_enviarTerminate(Sender: TIdThreadComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_consorcio: Tf_consorcio;

implementation

{$R *.fmx}

uses UPrincipal, UServerClasses;

var

server : TServerMethods1Client;

procedure Tf_consorcio.btenviarClick(Sender: TObject);
begin
      AniIndicator.Enabled := true;
      AniIndicator.Visible := true;
      thread_enviar.Create();
      thread_enviar.Active := true;
      
end;

procedure Tf_consorcio.btsimularClick(Sender: TObject);
begin
      if edlance.Text <> '' then
      begin
            lbparcelanova.Text := 'Valor da parcela nova: ' + formatfloat('R$ ###,##0.00',(((cds_modelos.FieldByName('VALOR_PARCELA').AsFloat * 84) - strtofloat(edlance.Text))/84));
            lbparcelanova.Visible := true;
      end
      else
      showmessage('Digite o valor do lance!');
end;

procedure Tf_consorcio.btvoltarClick(Sender: TObject);
begin
      f_consorcio.Close;
      f_consorcio.free;
end;

procedure Tf_consorcio.cbmodeloChange(Sender: TObject);
begin

      cds_modelos.Locate('IDVEICULO', LinkFillControlToField2.BindList.GetSelectedValue.AsString, []);
      lbmodelo.Text := 'Modelo: ' +  cds_modelos.FieldByName('MODELO').AsString;
      lbcredito.Text := 'Valor do Cr�dito: ' + formatfloat('R$ ###,##0.00', cds_modelos.FieldByName('VALOR_CREDITO').AsFloat);
      lbparcela.Text := 'Valor da Parcela: ' + formatfloat('R$ ###,##0.00', cds_modelos.FieldByName('VALOR_PARCELA').AsFloat);
      lbmodelo.Visible := true;
      lbcredito.Visible := true;
      lbparcela.Visible := true;

end;

procedure Tf_consorcio.edlanceExit(Sender: TObject);
begin
      if edlance.Text = '' then
      edlance.Text := '0';
      edlance.Text := formatfloat('0.00', strtofloat(edlance.Text));
end;

procedure Tf_consorcio.edlanceKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
      if key = vkreturn then
      begin
           btsimularclick(sender);
      end;
end;

procedure Tf_consorcio.edvalorExit(Sender: TObject);

begin
       AniIndicator.enabled := true;
       AniIndicator.visible := true;
       thread_consorcio.Create();
       thread_consorcio.Active := true;
end;

procedure Tf_consorcio.edvalorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
       if key = vkreturn then
      begin
            edlance.SetFocus;
      end;
end;

procedure Tf_consorcio.thread_consorcioRun(Sender: TIdThreadComponent);
begin
               SQLConnection1.Params.Clear;
               SQLConnection1.Params.Add('HostName='+f_principal.servidor);
               SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
               SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
               SQLConnection1.Params.Add('DatasnapContext=datasnap/');
               SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
               SQLConnection1.Params.Add('DriverName=DataSnap');
               SQLConnection1.Params.Add('port=211');
               edvalor.Text := formatfloat('0.00', strtofloat(edvalor.Text));

              if cds_modelos.Active = true then
              cds_modelos.Active := false;

              if SQLConnection1.Connected = false then
              SQLConnection1.Connected := true;

              server := TServerMethods1client.Create(SQLConnection1.DBXConnection);

              server.consorcio_consulta(floattostr((strtofloat(edvalor.text)-100)),floattostr(strtofloat(edvalor.text)+100));

              cds_modelos.Active := true;
              AniIndicator.enabled := false;
	            AniIndicator.visible := false;
              cbmodelo.Enabled := true;
              thread_consorcio.stop;
              thread_consorcio.terminate;
end;

procedure Tf_consorcio.thread_enviarRun(Sender: TIdThreadComponent);
begin
       f_principal.conectar;
       server := TServerMethods1client.Create(f_principal.SQLConnection1.DBXConnection);
       server.consorcio_comprar(cbmodelo.Selected.Text, f_principal.nome, f_principal.email, f_principal.telefone);
       AniIndicator.Enabled := false;
       AniIndicator.Visible := false;
       thread_enviar.stop;
       thread_enviar.terminate;


end;

procedure Tf_consorcio.thread_enviarTerminate(Sender: TIdThreadComponent);
begin
      showmessage('Solicita��o enviada com sucesso! O vendedor entrar� em contato!');
      f_consorcio.Close;
      f_consorcio.Free;

end;

end.
