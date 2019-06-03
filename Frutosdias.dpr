program Frutosdias;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {f_principal},
  UAgendamento in 'UAgendamento.pas' {f_agendamento},
  UConfiguracoes in 'UConfiguracoes.pas' {f_configuracoes},
  UConsorcio in 'UConsorcio.pas' {f_consorcio},
  UNovo_carro in 'UNovo_carro.pas' {f_novo_carro},
  URevisoes in 'URevisoes.pas' {f_revisoes},
  UVenda_Direta in 'UVenda_Direta.pas' {f_venda_direta},
  UServerClasses in 'UServerClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(Tf_principal, f_principal);
  Application.Run;
end.
