unit UVenda_Direta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  Data.Bind.Components, Data.Bind.DBScope, Data.SqlExpr, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, FMX.Edit, FMX.StdCtrls, FMX.ListBox,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  IdThreadComponent, IdBaseComponent;

type
  Tf_venda_direta = class(TForm)
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
    cbcliente: TComboBox;
    Layout30: TLayout;
    Layout31: TLayout;
    Layout32: TLayout;
    btenviar: TButton;
    Layout1: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout8: TLayout;
    Layout7: TLayout;
    Label1: TLabel;
    Layout9: TLayout;
    Label2: TLabel;
    cbfinanciar: TComboBox;
    Layout10: TLayout;
    Label3: TLabel;
    edvalor: TEdit;
    cds_modelos: TClientDataSet;
    cds_modelosCOD_PRODUTO: TFMTBCDField;
    cds_modelosDESCRICAO_PRODUTO: TStringField;
    DSProviderConnection1: TDSProviderConnection;
    cds_tipo_cliente: TClientDataSet;
    cds_tipo_clienteDESCRICAO: TStringField;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    SQLConnection1: TSQLConnection;
    BindSourceDB2: TBindSourceDB;
    BindSourceDB1: TBindSourceDB;
    AniIndicator: TAniIndicator;
    thread_enviar: TIdThreadComponent;
    Layout2: TLayout;
    edentrada: TEdit;
    Label4: TLabel;
    procedure btenviarClick(Sender: TObject);
    procedure btvoltarClick(Sender: TObject);
    procedure cbfinanciarChange(Sender: TObject);
    procedure edvalorExit(Sender: TObject);
    procedure edvalorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure thread_enviarRun(Sender: TIdThreadComponent);
    procedure thread_enviarTerminate(Sender: TIdThreadComponent);
    procedure edentradaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edentradaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_venda_direta: Tf_venda_direta;

implementation

{$R *.fmx}

uses UPrincipal, UServerClasses;

var

server : TServerMethods1client;

procedure Tf_venda_direta.btenviarClick(Sender: TObject);
begin
       AniIndicator.Enabled := true;
       AniIndicator.Visible := true;
       thread_enviar.Create();
       thread_enviar.Active := true;
end;

procedure Tf_venda_direta.btvoltarClick(Sender: TObject);
begin
      f_venda_direta.Close;
      f_venda_direta.free;
end;

procedure Tf_venda_direta.cbfinanciarChange(Sender: TObject);
begin
      if cbfinanciar.selected.Text = 'SIM' then
       begin
            edvalor.Enabled := true;
            edentrada.Enabled := true;
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

procedure Tf_venda_direta.edentradaExit(Sender: TObject);
begin
      if edentrada.Text <> '' then
       edentrada.Text := formatfloat('###,##0.00', strtofloat(edentrada.Text));
end;

procedure Tf_venda_direta.edentradaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
      if key = vkreturn then
      begin
            btenviarclick(sender);
      end;
end;

procedure Tf_venda_direta.edvalorExit(Sender: TObject);
begin
       if edvalor.Text <> '' then
       edvalor.Text := formatfloat('###,##0.00', strtofloat(edvalor.Text));
end;

procedure Tf_venda_direta.edvalorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
      if key = vkreturn then
      begin
            edentrada.SetFocus;
      end;

end;

procedure Tf_venda_direta.thread_enviarRun(Sender: TIdThreadComponent);
begin
      f_principal.conectar;
      server := TServerMethods1client.Create(f_principal.SQLConnection1.DBXConnection);
      server.comprar_vd(cbcarro.Selected.Text, f_principal.nome, f_principal.email, f_principal.telefone, cbfinanciar.Selected.Text, edvalor.Text, cbcliente.Selected.Text, edentrada.text);
      AniIndicator.enabled := false;
      AniIndicator.visible := false;
      thread_enviar.Stop;
      thread_enviar.Terminate;


end;

procedure Tf_venda_direta.thread_enviarTerminate(Sender: TIdThreadComponent);
begin
      showmessage('Solicitação enviada com sucesso! O vendedor entrará em contato!');
      f_venda_direta.Close;
      f_venda_direta.Free;
end;

end.
