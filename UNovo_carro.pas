unit UNovo_carro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Datasnap.DBClient, Datasnap.DSConnect, Data.Bind.Components, Data.DB,
  Data.SqlExpr, Data.Bind.DBScope, FMX.StdCtrls, FMX.Edit, FMX.ListBox,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, System.Math,
  FMX.Ani, FMX.VirtualKeyboard, FMX.Platform, IdThreadComponent, IdBaseComponent;

type
  Tf_novo_carro = class(TForm)
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
    cbcarro: TComboBox;
    Label12: TLabel;
    Layout29: TLayout;
    Label13: TLabel;
    cbfinanciar: TComboBox;
    Layout30: TLayout;
    Layout31: TLayout;
    Layout32: TLayout;
    btenviar: TButton;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout6: TLayout;
    Layout27: TLayout;
    Layout8: TLayout;
    Layout7: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Label1: TLabel;
    Layout11: TLayout;
    Label2: TLabel;
    edvalor: TEdit;
    AniIndicator: TAniIndicator;
    BindSourceDB3: TBindSourceDB;
    SQLConnection1: TSQLConnection;
    cds_modelos: TClientDataSet;
    cds_modelosCOD_PRODUTO: TFMTBCDField;
    cds_modelosDESCRICAO_PRODUTO: TStringField;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    DSProviderConnection1: TDSProviderConnection;
    thread_enviar: TIdThreadComponent;

    procedure btenviarClick(Sender: TObject);
    procedure btvoltarClick(Sender: TObject);
    procedure cbfinanciarChange(Sender: TObject);
    procedure edvalorExit(Sender: TObject);
    procedure edvalorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure thread_enviarRun(Sender: TIdThreadComponent);
    procedure thread_enviarTerminate(Sender: TIdThreadComponent);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  f_novo_carro: Tf_novo_carro;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

uses UServerClasses, UPrincipal;

var

server : TServerMethods1client;

procedure Tf_novo_carro.btenviarClick(Sender: TObject);
begin
       AniIndicator.Enabled := true;
       AniIndicator.Visible := true;
       thread_enviar.Active := true;
      

end;

procedure Tf_novo_carro.btvoltarClick(Sender: TObject);
begin

      f_novo_carro.Close;
      f_novo_carro.free;
end;



procedure Tf_novo_carro.cbfinanciarChange(Sender: TObject);
begin
      if cbfinanciar.selected.Text = 'SIM' then
       begin
            edvalor.Enabled := true;
            if cbcarro.Selected.Text <> '' then
            begin
                  btenviar.Enabled := true
            end;
       end
       else
       begin
       edvalor.Enabled := false;
       btenviar.Enabled := true;
       end;
end;

procedure Tf_novo_carro.edvalorExit(Sender: TObject);
begin
      if edvalor.Text <> '' then
      edvalor.Text := formatfloat('###,##0.00', strtofloat(edvalor.Text));
end;

procedure Tf_novo_carro.edvalorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
        if key = vkreturn then
      begin
            btenviarclick(sender);
      end;

end;



procedure Tf_novo_carro.thread_enviarRun(Sender: TIdThreadComponent);
begin
      f_principal.conectar;
      server := TServerMethods1client.Create(f_principal.SQLConnection1.DBXConnection);
      server.compar_carro(f_principal.email, cbcarro.Selected.Text, f_principal.nome, f_principal.email, f_principal.telefone, cbfinanciar.Items.Text, edvalor.text);
      AniIndicator.enabled := false;
      AniIndicator.visible := false;
      thread_enviar.Stop;
      thread_enviar.Terminate;

end;

procedure Tf_novo_carro.thread_enviarTerminate(Sender: TIdThreadComponent);
begin
      showmessage('Solicitação enviada com sucesso! O vendedor entrará em contato!');
      f_novo_carro.Close;
      f_novo_carro.Free;
end;



end.
