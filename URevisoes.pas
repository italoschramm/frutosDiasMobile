unit URevisoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.ListView, FMX.Layouts,
  FMX.TabControl, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr,
  Data.Bind.Components, Data.Bind.DBScope, Fmx.Bind.Editors, FMX.ScrollBox,
  FMX.Memo;

type
  Tf_revisoes = class(TForm)
    BindingsList1: TBindingsList;
    BindingsList2: TBindingsList;
    cds_orcamentos_pecas: TClientDataSet;
    cds_orcamentos_pecasNUMERO_OS: TFMTBCDField;
    cds_orcamentos_pecasCOD_ITEM: TStringField;
    cds_orcamentos_pecasPRECO_VENDA: TFMTBCDField;
    cds_orcamentos_pecasDESCRICAO: TStringField;
    cds_os: TClientDataSet;
    cds_osNUMERO_OS: TFMTBCDField;
    cds_osSTATUS_OS: TFMTBCDField;
    cds_osSTATUS: TStringField;
    cds_osDATA_EMISSAO: TDateTimeField;
    cds_osHORA_EMISSAO: TStringField;
    cds_osCOD_CLIENTE: TFMTBCDField;
    cds_osVALOR_SERVICOS_BRUTO: TBCDField;
    cds_osVALOR_ITENS_BRUTO: TBCDField;
    cds_osDESCONTOS_SERVICOS: TBCDField;
    cds_osDESCONTOS_ITENS: TBCDField;
    cds_osVALOR_SERVICOS_LIQUIDO: TFMTBCDField;
    cds_osVALOR_ITENS_LIQUIDO: TFMTBCDField;
    cds_osTOTAL_BRUTO: TFMTBCDField;
    cds_osTOTAL_DESCONTO: TFMTBCDField;
    cds_osTOTAL_LIQUIDO: TFMTBCDField;
    BindSourceDB7: TBindSourceDB;
    cds_orcamentos_servicos: TClientDataSet;
    cds_orcamentos_servicosNUMERO_OS: TFMTBCDField;
    cds_orcamentos_servicosCOD_SERVICO: TStringField;
    cds_orcamentos_servicosPRECO_VENDA: TBCDField;
    cds_orcamentos_servicosDESCRICAO_SERVICO: TStringField;
    cds_orcamentos: TClientDataSet;
    cds_orcamentosNUMERO_OS: TFMTBCDField;
    cds_orcamentosSTATUS_OS: TFMTBCDField;
    cds_orcamentosSTATUS: TStringField;
    cds_orcamentosDATA_EMISSAO: TDateTimeField;
    cds_orcamentosHORA_EMISSAO: TStringField;
    cds_orcamentosCOD_CLIENTE: TFMTBCDField;
    cds_orcamentosVALOR_SERVICOS_BRUTO: TBCDField;
    cds_orcamentosVALOR_ITENS_BRUTO: TBCDField;
    cds_orcamentosDESCONTOS_SERVICOS: TBCDField;
    cds_orcamentosDESCONTOS_ITENS: TBCDField;
    cds_orcamentosVALOR_SERVICOS_LIQUIDO: TFMTBCDField;
    cds_orcamentosVALOR_ITENS_LIQUIDO: TFMTBCDField;
    cds_orcamentosTOTAL_BRUTO: TFMTBCDField;
    cds_orcamentosTOTAL_DESCONTO: TFMTBCDField;
    cds_orcamentosTOTAL_LIQUIDO: TFMTBCDField;
    cds_os_servicos: TClientDataSet;
    cds_os_servicosNUMERO_OS: TFMTBCDField;
    cds_os_servicosCOD_SERVICO: TStringField;
    cds_os_servicosPRECO_VENDA: TBCDField;
    cds_os_servicosDESCRICAO_SERVICO: TStringField;
    cds_os_pecas: TClientDataSet;
    cds_os_pecasNUMERO_OS: TFMTBCDField;
    cds_os_pecasCOD_ITEM: TStringField;
    cds_os_pecasPRECO_VENDA: TFMTBCDField;
    cds_os_pecasDESCRICAO: TStringField;
    SQLConnection1: TSQLConnection;
    BindSourceDB1: TBindSourceDB;
    DSProviderConnection1: TDSProviderConnection;
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TScaledLayout;
    TabControl2: TTabControl;
    tborcamentos: TTabItem;
    Layout10: TLayout;
    ListView1: TListView;
    tborcamentos_detalhe: TTabItem;
    Layout11: TLayout;
    ScaledLayout3: TScaledLayout;
    Layout22: TLayout;
    Layout12: TLayout;
    ed_os: TEdit;
    Label3: TLabel;
    Layout13: TLayout;
    Layout14: TLayout;
    eddata: TEdit;
    Label4: TLabel;
    Layout15: TLayout;
    edstatus: TEdit;
    Label5: TLabel;
    Layout16: TLayout;
    edvalor: TEdit;
    Label6: TLabel;
    Layout17: TLayout;
    edservicos: TEdit;
    Label7: TLabel;
    Layout18: TLayout;
    edpecas: TEdit;
    Label8: TLabel;
    Layout19: TLayout;
    eddescontos: TEdit;
    Label9: TLabel;
    Layout21: TLayout;
    Layout23: TLayout;
    Layout4: TLayout;
    btaprovar: TSpeedButton;
    Image5: TImage;
    Layout5: TLayout;
    tborcamentos_servicos: TTabItem;
    Layout24: TLayout;
    ListView2: TListView;
    tborcamentos_pecas: TTabItem;
    Layout25: TLayout;
    ListView3: TListView;
    tbservicos: TTabItem;
    Image1: TImage;
    Image4: TImage;
    Layout27: TLayout;
    Layout1: TLayout;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Label2: TLabel;
    tbos: TTabItem;
    Layout6: TLayout;
    tbos_detalhe: TTabItem;
    Layout7: TLayout;
    ScaledLayout1: TScaledLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    edos_os: TEdit;
    Label10: TLabel;
    Layout26: TLayout;
    Layout28: TLayout;
    edos_data: TEdit;
    Label11: TLabel;
    Layout29: TLayout;
    edos_status: TEdit;
    Label12: TLabel;
    Layout30: TLayout;
    edos_valor: TEdit;
    Label13: TLabel;
    Layout31: TLayout;
    edos_servicos: TEdit;
    Label14: TLabel;
    Layout32: TLayout;
    edos_pecas: TEdit;
    Label15: TLabel;
    Layout33: TLayout;
    edos_desconto: TEdit;
    Label16: TLabel;
    Layout34: TLayout;
    btos_servicos: TSpeedButton;
    Image7: TImage;
    Layout35: TLayout;
    btos_pecas: TSpeedButton;
    Image8: TImage;
    Layout36: TLayout;
    Layout37: TLayout;
    Layout38: TLayout;
    tbos_servicos: TTabItem;
    Layout39: TLayout;
    ListView5: TListView;
    tbos_pecas: TTabItem;
    Layout40: TLayout;
    ListView6: TListView;
    ToolBar1: TToolBar;
    Image6: TImage;
    btvoltar: TImage;
    lbtitulo: TLabel;
    AniIndicator: TAniIndicator;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    BindSourceDB5: TBindSourceDB;
    LinkListControlToField6: TLinkListControlToField;
    VertScrollBox2: TVertScrollBox;
    tbcpf: TTabItem;
    Layout41: TLayout;
    Layout42: TLayout;
    Label17: TLabel;
    Layout43: TLayout;
    btcadastro: TButton;
    LinkFillControlToField: TLinkFillControlToField;
    ListView4: TListView;
    LinkListControlToField4: TLinkListControlToField;
    tbos_fechadas: TTabItem;
    VertScrollBox3: TVertScrollBox;
    Layout44: TLayout;
    ListView7: TListView;
    BindSourceDB6: TBindSourceDB;
    LinkListControlToField7: TLinkListControlToField;
    Layout45: TLayout;
    cktermos: TCheckBox;
    Layout46: TLayout;
    tbtermos: TTabItem;
    memo: TMemo;
    Layout47: TLayout;
    Layout48: TLayout;
    btpecas: TSpeedButton;
    Image3: TImage;
    btservicos: TSpeedButton;
    Image2: TImage;
    bttermos: TSpeedButton;
    procedure Image1Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image3Click(Sender: TObject);
    procedure btpecasClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btservicosClick(Sender: TObject);
    procedure btaprovarClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure btvoltarClick(Sender: TObject);
    procedure AniIndicatorClick(Sender: TObject);
    procedure btos_pecasClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure btos_servicosClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure btcadastroClick(Sender: TObject);
    procedure ListView4ApplyStyleLookup(Sender: TObject);
    procedure ListView4Click(Sender: TObject);
    procedure btabertasClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure bttermosClick(Sender: TObject);
  private
    { Private declarations }
    valor_servico, valor_servico_desconto, valor_itens, valor_itens_desconto : string;
  public
    { Public declarations }
  end;

var
  f_revisoes: Tf_revisoes;

implementation

{$R *.fmx}

uses UPrincipal, UServerClasses;

var

server : TServerMethods1client;

procedure Tf_revisoes.btpecasClick(Sender: TObject);
begin
      AniIndicator.Enabled := true;
       AniIndicator.Visible := true;

       cds_orcamentos_pecas.Active := false;

       TThread.CreateAnonymousThread(
       procedure()
       begin
       try
              sqlconnection1.Connected := true;
              server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
              server.consulta_orcamento_itens(ed_os.Text);
              cds_orcamentos_pecas.Active := true;
              if cds_orcamentos_pecas.Active = true then
              begin
                    lbtitulo.Text := 'Peças';
                    tborcamentos_pecas.IsSelected := true;
              end;

       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
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
end;

procedure Tf_revisoes.btservicosClick(Sender: TObject);
begin
      AniIndicator.Enabled := true;
       AniIndicator.Visible := true;

       cds_orcamentos_servicos.Active := false;

       TThread.CreateAnonymousThread(
       procedure()
       begin
       try
              sqlconnection1.Connected := true;
              server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
              server.consulta_orcamento_servicos(ed_os.Text);
              cds_orcamentos_servicos.Active := true;
              if cds_orcamentos_servicos.Active = true then
              begin
                    tborcamentos_servicos.IsSelected := true;
                    lbtitulo.Text := 'Serviços';
              end;

       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
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
end;

procedure Tf_revisoes.btvoltarClick(Sender: TObject);
begin
        if tbtermos.IsSelected = true then
        begin
              tborcamentos_detalhe.IsSelected := true;

        end
        else
        if tbcpf.IsSelected = true then
        begin
             f_revisoes.Close;
             f_revisoes.free;
        end
        else
        if tbos_pecas.IsSelected = true then
        begin
              lbtitulo.Text := 'OS';
              tbos_detalhe.IsSelected := true;
        end
        else
        if tbos_servicos.IsSelected = true then
        begin
              lbtitulo.Text := 'OS';
              tbos_detalhe.IsSelected := true;
        end
        else
        if tbos_detalhe.IsSelected = true then
        begin
              lbtitulo.Text := 'OS';
              tbos.IsSelected := true;
        end
        else
        if tbos.IsSelected = true then
        begin
              lbtitulo.Text := 'OS';
              tbservicos.IsSelected := true;
        end
        else
        if tborcamentos_detalhe.IsSelected = true then
        begin
              lbtitulo.Text := 'Orçamentos';
              tborcamentos.IsSelected := true;
        end
        else
        if tborcamentos_pecas.IsSelected = true then
        begin
              lbtitulo.Text := 'Orçamentos';
              tborcamentos_detalhe.IsSelected := true;
        end
        else
        if tborcamentos_servicos.IsSelected = true then
        begin
              lbtitulo.Text := 'Orçamentos';
              tborcamentos_detalhe.IsSelected := true;
        end
        else
        if tborcamentos.IsSelected = true then
        begin
              lbtitulo.Text := 'Serviços';
              tbservicos.IsSelected := true;
        end
        else
         if tbservicos.IsSelected = true then
        begin
              f_revisoes.Close;
              f_revisoes.free;
        end
end;

procedure Tf_revisoes.Image1Click(Sender: TObject);
begin
       f_revisoes.cds_orcamentos.Active := false;

                  AniIndicator.Enabled := true;
                  AniIndicator.Visible := true;

                  TThread.CreateAnonymousThread(
                  procedure()
                  begin
                  try

                  TThread.Synchronize(TThread.CurrentThread,
                  procedure()
                  begin
                           f_revisoes.SQLConnection1.Params.Clear;
                           f_revisoes.SQLConnection1.Params.Add('HostName='+f_principal.servidor);
                           f_revisoes.SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
                           f_revisoes.SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
                           f_revisoes.SQLConnection1.Params.Add('DatasnapContext=datasnap/');
                           f_revisoes.SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
                           f_revisoes.SQLConnection1.Params.Add('DriverName=DataSnap');
                           f_revisoes.SQLConnection1.Params.Add('port=211');

                           f_revisoes.sqlconnection1.Connected := true;
                           server := TServerMethods1client.Create(f_revisoes.SQLConnection1.DBXConnection);
                           lbtitulo.Text := 'Orçamentos';
                           server.consulta_orcamentos(f_principal.cpf);
                           f_revisoes.cds_orcamentos.Active := true;
                           f_revisoes.tborcamentos.IsSelected := true;



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

                  end).Start;








end;

procedure Tf_revisoes.Image2Click(Sender: TObject);
begin
      btservicosclick(sender);
end;

procedure Tf_revisoes.Image3Click(Sender: TObject);
begin
       btpecasclick(sender);
end;

procedure Tf_revisoes.Image4Click(Sender: TObject);
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

                           f_revisoes.cds_os.Active := false;

                           f_revisoes.SQLConnection1.Params.Clear;
                           f_revisoes.SQLConnection1.Params.Add('HostName='+f_principal.servidor);
                           f_revisoes.SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
                           f_revisoes.SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
                           f_revisoes.SQLConnection1.Params.Add('DatasnapContext=datasnap/');
                           f_revisoes.SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
                           f_revisoes.SQLConnection1.Params.Add('DriverName=DataSnap');
                           f_revisoes.SQLConnection1.Params.Add('port=211');

                           f_revisoes.sqlconnection1.Connected := true;
                           server := TServerMethods1client.Create(f_revisoes.SQLConnection1.DBXConnection);
                           server.consulta_os(f_principal.cpf);
                           f_revisoes.cds_os.Active := true;
                           f_revisoes.tbos.IsSelected := true;
                           lbtitulo.Text := 'OS';

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

                  end).Start;

end;

procedure Tf_revisoes.Image5Click(Sender: TObject);
begin
      btaprovarclick(sender);
end;

procedure Tf_revisoes.Image7Click(Sender: TObject);
begin
      btos_servicosclick(sender);
end;

procedure Tf_revisoes.Image8Click(Sender: TObject);
begin
      btos_pecasclick(sender);
end;

procedure Tf_revisoes.Label18Click(Sender: TObject);
begin
      tbtermos.IsSelected := true;
end;

procedure Tf_revisoes.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
        f_revisoes.SQLConnection1.Params.Clear;
       f_revisoes.SQLConnection1.Params.Add('HostName='+f_principal.servidor);
       f_revisoes.SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
       f_revisoes.SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
       f_revisoes.SQLConnection1.Params.Add('DatasnapContext=datasnap/');
       f_revisoes.SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
       f_revisoes.SQLConnection1.Params.Add('DriverName=DataSnap');
       f_revisoes.SQLConnection1.Params.Add('port=211');

       f_revisoes.sqlconnection1.Connected := false;
       f_revisoes.sqlconnection1.Connected := true;
       server := TServerMethods1client.Create(f_revisoes.SQLConnection1.DBXConnection);
       server.consulta_orcamentos_total(cds_orcamentos.FieldByName('NUMERO_OS').AsString, cds_orcamentos.FieldByName('NUMERO_OS').AsString, valor_servico, valor_servico_desconto, valor_itens, valor_itens_desconto);
       lbtitulo.Text := 'Orçamentos';
       //f_revisoes.cds_orcamentos_servicos.Active := true;
       //cds_orcamentos_itens.Active := true;


            ed_os.text := cds_orcamentos.FieldByName('NUMERO_OS').AsString;
            eddata.Text := cds_orcamentos.FieldByName('DATA_EMISSAO').AsString;
            edstatus.Text := cds_orcamentos.FieldByName('STATUS').AsString;
            edvalor.Text := formatfloat('R$ ###,##0.00', (strtofloat(valor_servico) + strtofloat(valor_itens)));
            edservicos.Text := formatfloat('R$ ###,##0.00', (strtofloat(valor_servico)));
            edpecas.Text := formatfloat('R$ ###,##0.00', (strtofloat(valor_itens)));
            eddescontos.Text := formatfloat('R$ ###,##0.00', (strtofloat(valor_servico_desconto) + strtofloat(valor_itens_desconto)));
            tborcamentos_detalhe.IsSelected := true;
end;

procedure Tf_revisoes.ListView4ApplyStyleLookup(Sender: TObject);
var
 i : integer;
begin
      for i := 0 to listView4.Items.Count -1 do

      if listView4.Items[i].Detail = '1' then
      listView4.BeginUpdate;
      listView4.Items[i].Objects.TextObject.TextColor := 444444;
      listView4.EndUpdate;
end;


procedure Tf_revisoes.ListView4Click(Sender: TObject);
begin
       f_revisoes.SQLConnection1.Params.Clear;
       f_revisoes.SQLConnection1.Params.Add('HostName='+f_principal.servidor);
       f_revisoes.SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
       f_revisoes.SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
       f_revisoes.SQLConnection1.Params.Add('DatasnapContext=datasnap/');
       f_revisoes.SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
       f_revisoes.SQLConnection1.Params.Add('DriverName=DataSnap');
       f_revisoes.SQLConnection1.Params.Add('port=211');

       f_revisoes.sqlconnection1.Connected := true;
       server := TServerMethods1client.Create(f_revisoes.SQLConnection1.DBXConnection);
       //server.consulta_orcamentos_total(cds_orcamentos.FieldByName('NUMERO_OS').AsString, cds_orcamentos.FieldByName('NUMERO_OS').AsString, valor_servico, valor_servico_desconto, valor_itens, valor_itens_desconto);

       //f_revisoes.cds_orcamentos_servicos.Active := true;
       //cds_orcamentos_itens.Active := true;

            edos_os.text := cds_os.FieldByName('NUMERO_OS').AsString;
            edos_data.Text := cds_os.FieldByName('DATA_EMISSAO').AsString;
            edos_status.Text := cds_os.FieldByName('STATUS').AsString;
            edos_valor.Text := formatfloat('R$ ###,##0.00', (cds_os.FieldByName('TOTAL_LIQUIDO').asfloat));
            edos_servicos.Text := formatfloat('R$ ###,##0.00', (cds_os.FieldByName('VALOR_SERVICOS_BRUTO').asfloat));
            edos_pecas.Text := formatfloat('R$ ###,##0.00', (cds_os.FieldByName('VALOR_ITENS_BRUTO').asfloat));
            edos_desconto.Text := formatfloat('R$ ###,##0.00', (cds_os.FieldByName('TOTAL_DESCONTO').asfloat));
            tbos_detalhe.IsSelected := true;
end;

procedure Tf_revisoes.bttermosClick(Sender: TObject);
begin
      tbtermos.IsSelected := true;
end;

procedure Tf_revisoes.AniIndicatorClick(Sender: TObject);
begin
      btos_pecasclick(sender);
end;

procedure Tf_revisoes.btabertasClick(Sender: TObject);
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

                           f_revisoes.cds_os.Active := false;

                           f_revisoes.SQLConnection1.Params.Clear;
                           f_revisoes.SQLConnection1.Params.Add('HostName='+f_principal.servidor);
                           f_revisoes.SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
                           f_revisoes.SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
                           f_revisoes.SQLConnection1.Params.Add('DatasnapContext=datasnap/');
                           f_revisoes.SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
                           f_revisoes.SQLConnection1.Params.Add('DriverName=DataSnap');
                           f_revisoes.SQLConnection1.Params.Add('port=211');

                           f_revisoes.sqlconnection1.Connected := true;
                           server := TServerMethods1client.Create(f_revisoes.SQLConnection1.DBXConnection);
                           server.consulta_os(f_principal.cod_cliente_nbs);
                           f_revisoes.cds_os.Active := true;
                           f_revisoes.tbos.IsSelected := true;


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

                  end).Start;
end;

procedure Tf_revisoes.btaprovarClick(Sender: TObject);
var
result : integer;
resultado : integer;
begin

      if cktermos.IsChecked = true then
      begin

      MessageDlg('Confirma aprovação do orçamento?', System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
            case AResult of
            mrYES:
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

                      sqlconnection1.Connected := true;
                      server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
                      resultado := server.aprovar_os(f_principal.email, ed_os.Text);

                      if resultado = 1 then
                      begin
                            tbservicos.IsSelected := true;
                            AniIndicator.enabled := false;
	                         AniIndicator.visible := false;
                            Showmessage('Orçamento aprovado com sucesso!');
                      end
                      else
                      showmessage('Erro ao aprovar!');

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
            end;
            mrNo:
                  // caso não
            end;


      end);
      end
      else
      showmessage('É necessário confirmação de leitura dos termos!');
end;

procedure Tf_revisoes.btcadastroClick(Sender: TObject);
begin
      f_principal.btconfiguracoesclick(sender);
      f_revisoes.Close;
      f_revisoes.free;
end;

procedure Tf_revisoes.btos_pecasClick(Sender: TObject);
begin
      AniIndicator.Enabled := true;
       AniIndicator.Visible := true;

       cds_os_pecas.Active := false;

       TThread.CreateAnonymousThread(
       procedure()
       begin
       try
              sqlconnection1.Connected := true;
              server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
              server.consulta_pecas(edos_os.Text);
              cds_os_pecas.Active := true;
              if cds_os_pecas.Active = true then
              begin
                    lbtitulo.Text := 'Peças';
                    tbos_pecas.IsSelected := true;
              end;

              AniIndicator.enabled := false;
	            AniIndicator.visible := false;

       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
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
end;

procedure Tf_revisoes.btos_servicosClick(Sender: TObject);
begin
      AniIndicator.Enabled := true;
       AniIndicator.Visible := true;

       cds_os_servicos.Active := false;

       TThread.CreateAnonymousThread(
       procedure()
       begin
       try
              sqlconnection1.Connected := true;
              server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
              server.consulta_servicos(edos_os.Text);
              cds_os_servicos.Active := true;
              if cds_os_servicos.Active = true then
              begin
                    tbos_servicos.IsSelected := true;
                    lbtitulo.Text := 'Serviços';
              end;

              AniIndicator.enabled := false;
	            AniIndicator.visible := false;

       TThread.Synchronize(TThread.CurrentThread,
       procedure()
       begin
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
end;

end.
