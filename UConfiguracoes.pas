unit UConfiguracoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr,
  FMX.Layouts, FMX.Ani, FMX.Edit, FMX.TabControl, FMX.StdCtrls, FMX.Objects,
  FMX.Controls.Presentation, IniFiles;

type
  Tf_configuracoes = class(TForm)
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    ToolBar1: TToolBar;
    Image6: TImage;
    btvoltar: TImage;
    lbtitulo: TLabel;
    TabControl2: TTabControl;
    tbcomprar_carro: TTabItem;
    Layout34: TLayout;
    ednome: TEdit;
    ColorAnimation3: TColorAnimation;
    Label16: TLabel;
    Layout35: TLayout;
    Layout36: TLayout;
    Layout37: TLayout;
    Layout38: TLayout;
    Layout39: TLayout;
    Label1: TLabel;
    edtelefone: TEdit;
    ColorAnimation2: TColorAnimation;
    Layout40: TLayout;
    Layout1: TLayout;
    Layout41: TLayout;
    Label17: TLabel;
    edsenha1: TEdit;
    ColorAnimation4: TColorAnimation;
    Layout42: TLayout;
    Layout43: TLayout;
    Label18: TLabel;
    edsenha2: TEdit;
    ColorAnimation5: TColorAnimation;
    Layout44: TLayout;
    Layout7: TLayout;
    Label15: TLabel;
    edemail: TEdit;
    ColorAnimation1: TColorAnimation;
    ScaledLayout2: TScaledLayout;
    edcpf: TEdit;
    Label14: TLabel;
    btsalvar: TImage;
    Layout2: TLayout;
    SQLConnection1: TSQLConnection;
    Layout3: TLayout;
    Image1: TImage;
    procedure btsalvarClick(Sender: TObject);
    procedure ednomeKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edcpfKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edemailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edsenha1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edsenha2KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btvoltarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_configuracoes: Tf_configuracoes;

implementation

{$R *.fmx}

uses UServerClasses, UPrincipal;

var

server : TServerMethods1client;

procedure Tf_configuracoes.btsalvarClick(Sender: TObject);
var
result : integer;
begin
      if (edsenha1.Text = edsenha2.text) then
      begin
            if (ednome.Text <> '') and (edcpf.Text <> '') and (edtelefone.Text <> '')  then
            begin

                  if f_principal.validar_cpf(edcpf.Text) = true then
                  begin
                  server := TServerMethods1client.Create(SQLConnection1.DBXConnection);
                  server.atualiza_cliente(edemail.text, edsenha1.Text, edemail.text, edtelefone.Text, ednome.text, edcpf.Text, result);
                  if result = 1 then
                  begin
                        f_principal.cpf := edcpf.Text;
                        f_principal.cod_cliente_nbs := edcpf.Text;
                        showmessage('Atualizado com sucesso!');
                        f_configuracoes.Close;
                        f_configuracoes.Free;
                  end
                  else

                  if result = 0 then
                  begin
                        showmessage('Erro! Contate Administrador do Sistema!');
                  end;
                  end
                  else
                  showmessage('CPF Inválido!');
            end
            else
            showmessage('Campos Nome, CPF e Telefone são obrigatórios!');
      end
      else
      showmessage('Senha não são iguais!');
end;

procedure Tf_configuracoes.btvoltarClick(Sender: TObject);
begin

      f_configuracoes.Close;
      f_configuracoes.Free;
end;

procedure Tf_configuracoes.edcpfKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
       if key = vkreturn then
      begin
            edemail.SetFocus;
      end;
end;

procedure Tf_configuracoes.edemailKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
       if key = vkreturn then
      begin
            edtelefone.SetFocus;
      end;
end;

procedure Tf_configuracoes.ednomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
      if key = vkreturn then
      begin
            edcpf.SetFocus;
      end;
end;

procedure Tf_configuracoes.edsenha1KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
       if key = vkreturn then
      begin
            edsenha1.SetFocus;
      end;
end;

procedure Tf_configuracoes.edsenha2KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
       if key = vkreturn then
      begin
            btsalvarclick(sender);
      end;
end;

procedure Tf_configuracoes.Image1Click(Sender: TObject);
var
      Arquivo, Arquivo2 : TIniFile;
begin
     Arquivo := TIniFile.Create(GetHomePath + PathDelim + 'frutos.ini');
     Arquivo.WriteString('1','login', '');
     Arquivo.WriteString('2', 'senha', '');
     Arquivo.WriteString('3', 'facebook', '');
     Arquivo.Free;

     Arquivo2 := TIniFile.Create(GetHomePath + PathDelim + 'jsAuthFacebook.ini');
     Arquivo2.WriteString('Facebook','TokenAccess', '');
     Arquivo2.WriteString('Facebook', 'Email', '');
     Arquivo2.WriteString('Facebook', 'Id', '');
     Arquivo2.WriteString('Facebook', 'first_name', '');
     Arquivo2.Free;



     f_principal.tblogin.IsSelected := true;
     f_configuracoes.Close;
     f_configuracoes.Free;
end;

end.
