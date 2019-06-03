//
// Created by the DataSnap proxy generator.
// 01/03/2018 15:04:51
//

unit UServerClasses;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FautenticarCommand: TDBXCommand;
    Faprovar_osCommand: TDBXCommand;
    Fbuscar_clienteCommand: TDBXCommand;
    Fcadastrar_clienteCommand: TDBXCommand;
    Fconsulta_osCommand: TDBXCommand;
    Fconsulta_servicosCommand: TDBXCommand;
    Fconsulta_pecasCommand: TDBXCommand;
    Fconsulta_modelosCommand: TDBXCommand;
    Fconsulta_produtosCommand: TDBXCommand;
    Fconsulta_clienteCommand: TDBXCommand;
    Fcompar_carroCommand: TDBXCommand;
    Fmeu_carroCommand: TDBXCommand;
    Fcadastrar_meu_carroCommand: TDBXCommand;
    FagendamentoCommand: TDBXCommand;
    Fconsorcio_comprarCommand: TDBXCommand;
    Fatualiza_clienteCommand: TDBXCommand;
    Fconsulta_tipo_clienteCommand: TDBXCommand;
    Fcomprar_vdCommand: TDBXCommand;
    Fconsorcio_consultaCommand: TDBXCommand;
    Fconsulta_orcamentosCommand: TDBXCommand;
    Fconsulta_orcamentos_totalCommand: TDBXCommand;
    Fconsulta_orcamento_servicosCommand: TDBXCommand;
    Fconsulta_orcamento_itensCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function autenticar(login: string; senha: string): Integer;
    function aprovar_os(email: string; numero_os: string): Integer;
    procedure buscar_cliente(cod_cliente: string; var nome: string; var endereco: string);
    procedure cadastrar_cliente(cod_cliente: string; nome: string; email: string; telefone: string; senha: string; facebook: string; cpf: string; var result: Integer);
    procedure consulta_os(cod_cliente: string);
    procedure consulta_servicos(numero_os: string);
    procedure consulta_pecas(numero_os: string);
    procedure consulta_modelos;
    procedure consulta_produtos(cod_modelo: string);
    procedure consulta_cliente(login: string; var nome: string; var email: string; var telefone: string; var senha: string; var cpf: string);
    procedure compar_carro(cod_cliente: string; modelo: string; nome: string; email: string; telefone: string; financiar: string; valor: string);
    procedure meu_carro(login: string; var meucarro: string; var idveiculo: string; var kmatual: string);
    procedure cadastrar_meu_carro(login: string; placa: string; modelo: string; cor: string; kmatual: string; ano_fabricacao: string; ano_modelo: string; var result: Integer);
    procedure agendamento(nome: string; data: string; hora: string; placa: string; email: string; telefone: string; observacao: string; cpf: string);
    procedure consorcio_comprar(produto: string; nome: string; email: string; telefone: string);
    procedure atualiza_cliente(login: string; senha: string; email: string; telefone: string; nome: string; cpf: string; var result: Integer);
    procedure consulta_tipo_cliente;
    procedure comprar_vd(modelo: string; nome: string; email: string; telefone: string; financiar: string; valor: string; tipo_cliente: string; entrada: string);
    procedure consorcio_consulta(valor1: string; valor2: string);
    procedure consulta_orcamentos(cod_cliente: string);
    procedure consulta_orcamentos_total(numero_os: string; numero_os2: string; var valor_servico: string; var valor_servico_desconto: string; var valor_itens: string; var valor_itens_desconto: string);
    procedure consulta_orcamento_servicos(numero_os: string);
    procedure consulta_orcamento_itens(numero_os: string);
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.autenticar(login: string; senha: string): Integer;
begin
  if FautenticarCommand = nil then
  begin
    FautenticarCommand := FDBXConnection.CreateCommand;
    FautenticarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FautenticarCommand.Text := 'TServerMethods1.autenticar';
    FautenticarCommand.Prepare;
  end;
  FautenticarCommand.Parameters[0].Value.SetWideString(login);
  FautenticarCommand.Parameters[1].Value.SetWideString(senha);
  FautenticarCommand.ExecuteUpdate;
  Result := FautenticarCommand.Parameters[2].Value.GetInt32;
end;

function TServerMethods1Client.aprovar_os(email: string; numero_os: string): Integer;
begin
  if Faprovar_osCommand = nil then
  begin
    Faprovar_osCommand := FDBXConnection.CreateCommand;
    Faprovar_osCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Faprovar_osCommand.Text := 'TServerMethods1.aprovar_os';
    Faprovar_osCommand.Prepare;
  end;
  Faprovar_osCommand.Parameters[0].Value.SetWideString(email);
  Faprovar_osCommand.Parameters[1].Value.SetWideString(numero_os);
  Faprovar_osCommand.ExecuteUpdate;
  Result := Faprovar_osCommand.Parameters[2].Value.GetInt32;
end;

procedure TServerMethods1Client.buscar_cliente(cod_cliente: string; var nome: string; var endereco: string);
begin
  if Fbuscar_clienteCommand = nil then
  begin
    Fbuscar_clienteCommand := FDBXConnection.CreateCommand;
    Fbuscar_clienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fbuscar_clienteCommand.Text := 'TServerMethods1.buscar_cliente';
    Fbuscar_clienteCommand.Prepare;
  end;
  Fbuscar_clienteCommand.Parameters[0].Value.SetWideString(cod_cliente);
  Fbuscar_clienteCommand.Parameters[1].Value.SetWideString(nome);
  Fbuscar_clienteCommand.Parameters[2].Value.SetWideString(endereco);
  Fbuscar_clienteCommand.ExecuteUpdate;
  nome := Fbuscar_clienteCommand.Parameters[1].Value.GetWideString;
  endereco := Fbuscar_clienteCommand.Parameters[2].Value.GetWideString;
end;

procedure TServerMethods1Client.cadastrar_cliente(cod_cliente: string; nome: string; email: string; telefone: string; senha: string; facebook: string; cpf: string; var result: Integer);
begin
  if Fcadastrar_clienteCommand = nil then
  begin
    Fcadastrar_clienteCommand := FDBXConnection.CreateCommand;
    Fcadastrar_clienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fcadastrar_clienteCommand.Text := 'TServerMethods1.cadastrar_cliente';
    Fcadastrar_clienteCommand.Prepare;
  end;
  Fcadastrar_clienteCommand.Parameters[0].Value.SetWideString(cod_cliente);
  Fcadastrar_clienteCommand.Parameters[1].Value.SetWideString(nome);
  Fcadastrar_clienteCommand.Parameters[2].Value.SetWideString(email);
  Fcadastrar_clienteCommand.Parameters[3].Value.SetWideString(telefone);
  Fcadastrar_clienteCommand.Parameters[4].Value.SetWideString(senha);
  Fcadastrar_clienteCommand.Parameters[5].Value.SetWideString(facebook);
  Fcadastrar_clienteCommand.Parameters[6].Value.SetWideString(cpf);
  Fcadastrar_clienteCommand.Parameters[7].Value.SetInt32(result);
  Fcadastrar_clienteCommand.ExecuteUpdate;
  result := Fcadastrar_clienteCommand.Parameters[7].Value.GetInt32;
end;

procedure TServerMethods1Client.consulta_os(cod_cliente: string);
begin
  if Fconsulta_osCommand = nil then
  begin
    Fconsulta_osCommand := FDBXConnection.CreateCommand;
    Fconsulta_osCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_osCommand.Text := 'TServerMethods1.consulta_os';
    Fconsulta_osCommand.Prepare;
  end;
  Fconsulta_osCommand.Parameters[0].Value.SetWideString(cod_cliente);
  Fconsulta_osCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_servicos(numero_os: string);
begin
  if Fconsulta_servicosCommand = nil then
  begin
    Fconsulta_servicosCommand := FDBXConnection.CreateCommand;
    Fconsulta_servicosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_servicosCommand.Text := 'TServerMethods1.consulta_servicos';
    Fconsulta_servicosCommand.Prepare;
  end;
  Fconsulta_servicosCommand.Parameters[0].Value.SetWideString(numero_os);
  Fconsulta_servicosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_pecas(numero_os: string);
begin
  if Fconsulta_pecasCommand = nil then
  begin
    Fconsulta_pecasCommand := FDBXConnection.CreateCommand;
    Fconsulta_pecasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_pecasCommand.Text := 'TServerMethods1.consulta_pecas';
    Fconsulta_pecasCommand.Prepare;
  end;
  Fconsulta_pecasCommand.Parameters[0].Value.SetWideString(numero_os);
  Fconsulta_pecasCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_modelos;
begin
  if Fconsulta_modelosCommand = nil then
  begin
    Fconsulta_modelosCommand := FDBXConnection.CreateCommand;
    Fconsulta_modelosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_modelosCommand.Text := 'TServerMethods1.consulta_modelos';
    Fconsulta_modelosCommand.Prepare;
  end;
  Fconsulta_modelosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_produtos(cod_modelo: string);
begin
  if Fconsulta_produtosCommand = nil then
  begin
    Fconsulta_produtosCommand := FDBXConnection.CreateCommand;
    Fconsulta_produtosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_produtosCommand.Text := 'TServerMethods1.consulta_produtos';
    Fconsulta_produtosCommand.Prepare;
  end;
  Fconsulta_produtosCommand.Parameters[0].Value.SetWideString(cod_modelo);
  Fconsulta_produtosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_cliente(login: string; var nome: string; var email: string; var telefone: string; var senha: string; var cpf: string);
begin
  if Fconsulta_clienteCommand = nil then
  begin
    Fconsulta_clienteCommand := FDBXConnection.CreateCommand;
    Fconsulta_clienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_clienteCommand.Text := 'TServerMethods1.consulta_cliente';
    Fconsulta_clienteCommand.Prepare;
  end;
  Fconsulta_clienteCommand.Parameters[0].Value.SetWideString(login);
  Fconsulta_clienteCommand.Parameters[1].Value.SetWideString(nome);
  Fconsulta_clienteCommand.Parameters[2].Value.SetWideString(email);
  Fconsulta_clienteCommand.Parameters[3].Value.SetWideString(telefone);
  Fconsulta_clienteCommand.Parameters[4].Value.SetWideString(senha);
  Fconsulta_clienteCommand.Parameters[5].Value.SetWideString(cpf);
  Fconsulta_clienteCommand.ExecuteUpdate;
  nome := Fconsulta_clienteCommand.Parameters[1].Value.GetWideString;
  email := Fconsulta_clienteCommand.Parameters[2].Value.GetWideString;
  telefone := Fconsulta_clienteCommand.Parameters[3].Value.GetWideString;
  senha := Fconsulta_clienteCommand.Parameters[4].Value.GetWideString;
  cpf := Fconsulta_clienteCommand.Parameters[5].Value.GetWideString;
end;

procedure TServerMethods1Client.compar_carro(cod_cliente: string; modelo: string; nome: string; email: string; telefone: string; financiar: string; valor: string);
begin
  if Fcompar_carroCommand = nil then
  begin
    Fcompar_carroCommand := FDBXConnection.CreateCommand;
    Fcompar_carroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fcompar_carroCommand.Text := 'TServerMethods1.compar_carro';
    Fcompar_carroCommand.Prepare;
  end;
  Fcompar_carroCommand.Parameters[0].Value.SetWideString(cod_cliente);
  Fcompar_carroCommand.Parameters[1].Value.SetWideString(modelo);
  Fcompar_carroCommand.Parameters[2].Value.SetWideString(nome);
  Fcompar_carroCommand.Parameters[3].Value.SetWideString(email);
  Fcompar_carroCommand.Parameters[4].Value.SetWideString(telefone);
  Fcompar_carroCommand.Parameters[5].Value.SetWideString(financiar);
  Fcompar_carroCommand.Parameters[6].Value.SetWideString(valor);
  Fcompar_carroCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.meu_carro(login: string; var meucarro: string; var idveiculo: string; var kmatual: string);
begin
  if Fmeu_carroCommand = nil then
  begin
    Fmeu_carroCommand := FDBXConnection.CreateCommand;
    Fmeu_carroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fmeu_carroCommand.Text := 'TServerMethods1.meu_carro';
    Fmeu_carroCommand.Prepare;
  end;
  Fmeu_carroCommand.Parameters[0].Value.SetWideString(login);
  Fmeu_carroCommand.Parameters[1].Value.SetWideString(meucarro);
  Fmeu_carroCommand.Parameters[2].Value.SetWideString(idveiculo);
  Fmeu_carroCommand.Parameters[3].Value.SetWideString(kmatual);
  Fmeu_carroCommand.ExecuteUpdate;
  meucarro := Fmeu_carroCommand.Parameters[1].Value.GetWideString;
  idveiculo := Fmeu_carroCommand.Parameters[2].Value.GetWideString;
  kmatual := Fmeu_carroCommand.Parameters[3].Value.GetWideString;
end;

procedure TServerMethods1Client.cadastrar_meu_carro(login: string; placa: string; modelo: string; cor: string; kmatual: string; ano_fabricacao: string; ano_modelo: string; var result: Integer);
begin
  if Fcadastrar_meu_carroCommand = nil then
  begin
    Fcadastrar_meu_carroCommand := FDBXConnection.CreateCommand;
    Fcadastrar_meu_carroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fcadastrar_meu_carroCommand.Text := 'TServerMethods1.cadastrar_meu_carro';
    Fcadastrar_meu_carroCommand.Prepare;
  end;
  Fcadastrar_meu_carroCommand.Parameters[0].Value.SetWideString(login);
  Fcadastrar_meu_carroCommand.Parameters[1].Value.SetWideString(placa);
  Fcadastrar_meu_carroCommand.Parameters[2].Value.SetWideString(modelo);
  Fcadastrar_meu_carroCommand.Parameters[3].Value.SetWideString(cor);
  Fcadastrar_meu_carroCommand.Parameters[4].Value.SetWideString(kmatual);
  Fcadastrar_meu_carroCommand.Parameters[5].Value.SetWideString(ano_fabricacao);
  Fcadastrar_meu_carroCommand.Parameters[6].Value.SetWideString(ano_modelo);
  Fcadastrar_meu_carroCommand.Parameters[7].Value.SetInt32(result);
  Fcadastrar_meu_carroCommand.ExecuteUpdate;
  result := Fcadastrar_meu_carroCommand.Parameters[7].Value.GetInt32;
end;

procedure TServerMethods1Client.agendamento(nome: string; data: string; hora: string; placa: string; email: string; telefone: string; observacao: string; cpf: string);
begin
  if FagendamentoCommand = nil then
  begin
    FagendamentoCommand := FDBXConnection.CreateCommand;
    FagendamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FagendamentoCommand.Text := 'TServerMethods1.agendamento';
    FagendamentoCommand.Prepare;
  end;
  FagendamentoCommand.Parameters[0].Value.SetWideString(nome);
  FagendamentoCommand.Parameters[1].Value.SetWideString(data);
  FagendamentoCommand.Parameters[2].Value.SetWideString(hora);
  FagendamentoCommand.Parameters[3].Value.SetWideString(placa);
  FagendamentoCommand.Parameters[4].Value.SetWideString(email);
  FagendamentoCommand.Parameters[5].Value.SetWideString(telefone);
  FagendamentoCommand.Parameters[6].Value.SetWideString(observacao);
  FagendamentoCommand.Parameters[7].Value.SetWideString(cpf);
  FagendamentoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consorcio_comprar(produto: string; nome: string; email: string; telefone: string);
begin
  if Fconsorcio_comprarCommand = nil then
  begin
    Fconsorcio_comprarCommand := FDBXConnection.CreateCommand;
    Fconsorcio_comprarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsorcio_comprarCommand.Text := 'TServerMethods1.consorcio_comprar';
    Fconsorcio_comprarCommand.Prepare;
  end;
  Fconsorcio_comprarCommand.Parameters[0].Value.SetWideString(produto);
  Fconsorcio_comprarCommand.Parameters[1].Value.SetWideString(nome);
  Fconsorcio_comprarCommand.Parameters[2].Value.SetWideString(email);
  Fconsorcio_comprarCommand.Parameters[3].Value.SetWideString(telefone);
  Fconsorcio_comprarCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.atualiza_cliente(login: string; senha: string; email: string; telefone: string; nome: string; cpf: string; var result: Integer);
begin
  if Fatualiza_clienteCommand = nil then
  begin
    Fatualiza_clienteCommand := FDBXConnection.CreateCommand;
    Fatualiza_clienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fatualiza_clienteCommand.Text := 'TServerMethods1.atualiza_cliente';
    Fatualiza_clienteCommand.Prepare;
  end;
  Fatualiza_clienteCommand.Parameters[0].Value.SetWideString(login);
  Fatualiza_clienteCommand.Parameters[1].Value.SetWideString(senha);
  Fatualiza_clienteCommand.Parameters[2].Value.SetWideString(email);
  Fatualiza_clienteCommand.Parameters[3].Value.SetWideString(telefone);
  Fatualiza_clienteCommand.Parameters[4].Value.SetWideString(nome);
  Fatualiza_clienteCommand.Parameters[5].Value.SetWideString(cpf);
  Fatualiza_clienteCommand.Parameters[6].Value.SetInt32(result);
  Fatualiza_clienteCommand.ExecuteUpdate;
  result := Fatualiza_clienteCommand.Parameters[6].Value.GetInt32;
end;

procedure TServerMethods1Client.consulta_tipo_cliente;
begin
  if Fconsulta_tipo_clienteCommand = nil then
  begin
    Fconsulta_tipo_clienteCommand := FDBXConnection.CreateCommand;
    Fconsulta_tipo_clienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_tipo_clienteCommand.Text := 'TServerMethods1.consulta_tipo_cliente';
    Fconsulta_tipo_clienteCommand.Prepare;
  end;
  Fconsulta_tipo_clienteCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.comprar_vd(modelo: string; nome: string; email: string; telefone: string; financiar: string; valor: string; tipo_cliente: string; entrada: string);
begin
  if Fcomprar_vdCommand = nil then
  begin
    Fcomprar_vdCommand := FDBXConnection.CreateCommand;
    Fcomprar_vdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fcomprar_vdCommand.Text := 'TServerMethods1.comprar_vd';
    Fcomprar_vdCommand.Prepare;
  end;
  Fcomprar_vdCommand.Parameters[0].Value.SetWideString(modelo);
  Fcomprar_vdCommand.Parameters[1].Value.SetWideString(nome);
  Fcomprar_vdCommand.Parameters[2].Value.SetWideString(email);
  Fcomprar_vdCommand.Parameters[3].Value.SetWideString(telefone);
  Fcomprar_vdCommand.Parameters[4].Value.SetWideString(financiar);
  Fcomprar_vdCommand.Parameters[5].Value.SetWideString(valor);
  Fcomprar_vdCommand.Parameters[6].Value.SetWideString(tipo_cliente);
  Fcomprar_vdCommand.Parameters[7].Value.SetWideString(entrada);
  Fcomprar_vdCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consorcio_consulta(valor1: string; valor2: string);
begin
  if Fconsorcio_consultaCommand = nil then
  begin
    Fconsorcio_consultaCommand := FDBXConnection.CreateCommand;
    Fconsorcio_consultaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsorcio_consultaCommand.Text := 'TServerMethods1.consorcio_consulta';
    Fconsorcio_consultaCommand.Prepare;
  end;
  Fconsorcio_consultaCommand.Parameters[0].Value.SetWideString(valor1);
  Fconsorcio_consultaCommand.Parameters[1].Value.SetWideString(valor2);
  Fconsorcio_consultaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_orcamentos(cod_cliente: string);
begin
  if Fconsulta_orcamentosCommand = nil then
  begin
    Fconsulta_orcamentosCommand := FDBXConnection.CreateCommand;
    Fconsulta_orcamentosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_orcamentosCommand.Text := 'TServerMethods1.consulta_orcamentos';
    Fconsulta_orcamentosCommand.Prepare;
  end;
  Fconsulta_orcamentosCommand.Parameters[0].Value.SetWideString(cod_cliente);
  Fconsulta_orcamentosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_orcamentos_total(numero_os: string; numero_os2: string; var valor_servico: string; var valor_servico_desconto: string; var valor_itens: string; var valor_itens_desconto: string);
begin
  if Fconsulta_orcamentos_totalCommand = nil then
  begin
    Fconsulta_orcamentos_totalCommand := FDBXConnection.CreateCommand;
    Fconsulta_orcamentos_totalCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_orcamentos_totalCommand.Text := 'TServerMethods1.consulta_orcamentos_total';
    Fconsulta_orcamentos_totalCommand.Prepare;
  end;
  Fconsulta_orcamentos_totalCommand.Parameters[0].Value.SetWideString(numero_os);
  Fconsulta_orcamentos_totalCommand.Parameters[1].Value.SetWideString(numero_os2);
  Fconsulta_orcamentos_totalCommand.Parameters[2].Value.SetWideString(valor_servico);
  Fconsulta_orcamentos_totalCommand.Parameters[3].Value.SetWideString(valor_servico_desconto);
  Fconsulta_orcamentos_totalCommand.Parameters[4].Value.SetWideString(valor_itens);
  Fconsulta_orcamentos_totalCommand.Parameters[5].Value.SetWideString(valor_itens_desconto);
  Fconsulta_orcamentos_totalCommand.ExecuteUpdate;
  valor_servico := Fconsulta_orcamentos_totalCommand.Parameters[2].Value.GetWideString;
  valor_servico_desconto := Fconsulta_orcamentos_totalCommand.Parameters[3].Value.GetWideString;
  valor_itens := Fconsulta_orcamentos_totalCommand.Parameters[4].Value.GetWideString;
  valor_itens_desconto := Fconsulta_orcamentos_totalCommand.Parameters[5].Value.GetWideString;
end;

procedure TServerMethods1Client.consulta_orcamento_servicos(numero_os: string);
begin
  if Fconsulta_orcamento_servicosCommand = nil then
  begin
    Fconsulta_orcamento_servicosCommand := FDBXConnection.CreateCommand;
    Fconsulta_orcamento_servicosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_orcamento_servicosCommand.Text := 'TServerMethods1.consulta_orcamento_servicos';
    Fconsulta_orcamento_servicosCommand.Prepare;
  end;
  Fconsulta_orcamento_servicosCommand.Parameters[0].Value.SetWideString(numero_os);
  Fconsulta_orcamento_servicosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.consulta_orcamento_itens(numero_os: string);
begin
  if Fconsulta_orcamento_itensCommand = nil then
  begin
    Fconsulta_orcamento_itensCommand := FDBXConnection.CreateCommand;
    Fconsulta_orcamento_itensCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fconsulta_orcamento_itensCommand.Text := 'TServerMethods1.consulta_orcamento_itens';
    Fconsulta_orcamento_itensCommand.Prepare;
  end;
  Fconsulta_orcamento_itensCommand.Parameters[0].Value.SetWideString(numero_os);
  Fconsulta_orcamento_itensCommand.ExecuteUpdate;
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FautenticarCommand.DisposeOf;
  Faprovar_osCommand.DisposeOf;
  Fbuscar_clienteCommand.DisposeOf;
  Fcadastrar_clienteCommand.DisposeOf;
  Fconsulta_osCommand.DisposeOf;
  Fconsulta_servicosCommand.DisposeOf;
  Fconsulta_pecasCommand.DisposeOf;
  Fconsulta_modelosCommand.DisposeOf;
  Fconsulta_produtosCommand.DisposeOf;
  Fconsulta_clienteCommand.DisposeOf;
  Fcompar_carroCommand.DisposeOf;
  Fmeu_carroCommand.DisposeOf;
  Fcadastrar_meu_carroCommand.DisposeOf;
  FagendamentoCommand.DisposeOf;
  Fconsorcio_comprarCommand.DisposeOf;
  Fatualiza_clienteCommand.DisposeOf;
  Fconsulta_tipo_clienteCommand.DisposeOf;
  Fcomprar_vdCommand.DisposeOf;
  Fconsorcio_consultaCommand.DisposeOf;
  Fconsulta_orcamentosCommand.DisposeOf;
  Fconsulta_orcamentos_totalCommand.DisposeOf;
  Fconsulta_orcamento_servicosCommand.DisposeOf;
  Fconsulta_orcamento_itensCommand.DisposeOf;
  inherited;
end;

end.

