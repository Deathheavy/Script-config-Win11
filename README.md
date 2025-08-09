# Minha automação pessoal para configuração do Windows 11
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Visão geral
Este script automatiza a instalação de alguns aplicativos usando o Winget, remove aplicativos pré-instalados indesejados do Windows 11 (bloatware) e configura várias opções de privacidade e telemetria para melhorar a segurança e o desempenho do sistema.

## Funcionalidades
Instala aplicativos via Winget

Programas instalados com o script:<br>
**Obs. Se você não usa algum dos programas basta remover em aplicativos**

Steam — Plataforma digital para compra e gerenciamento de jogos<br>
Discord — Aplicativo de comunicação por voz, vídeo e texto<br>
Brave Browser — Navegador focado em privacidade, bloqueia anúncios e rastreadores automaticamente.<br>
WinRAR — Programa para compactar e descompactar arquivos em vários formatos.<br>
qBittorrent — Cliente de torrent leve e de código aberto para download de arquivos P2P.<br>
VLC — Reprodutor multimídia versátil que suporta praticamente todos os formatos de vídeo e áudio.<br>

Remove apps comuns pré-instalados no Windows 11 considerados desnecessários ou invasivos.

Desativa IDs de publicidade, telemetria, serviços de localização, reconhecimento de voz, histórico de atividades e outras funções de coleta de dados.

Desliga conteúdos sugeridos no menu Iniciar e na tela de bloqueio.

Remove a Cortana e desativa o Copilot e o Recall

Configura o dns do sistema para o da Cloudflare(1.1.1.1 / 1.0.0.1)<br>

Desativa os serviços a seguir:<br>
**Obs. Se você usa algum dos serviços basta ativar novamente em services.msc**<br>

DiagTrack: Habilita o serviço de rastreamento de diagnósticos e telemetria para o Windows.<br>
RetailDemo: Gerencia o modo de demonstração para varejo em dispositivos.<br>
DiagnosticPolicyService: Habilita a detecção, solução de problemas e resolução de problemas no Windows.<br>
SysMain: Otimiza o desempenho do sistema através do pré-carregamento de aplicativos (Superfetch/SysMain).<br>
Fax: Permite enviar e receber documentos de fax.<br>
MapsBroker: Gerencia o acesso a serviços de mapas e localização.<br>
WSearch: Habilita o serviço de indexação para pesquisa de arquivos.<br>
WMPNetworkSvc: Compartilha bibliotecas de mídia do Windows Media Player com outros dispositivos na rede.<br>
SCardSvr: Gerencia o acesso a leitores de cartão inteligente.<br>
PrintSpooler: Gerencia a fila de documentos para impressão.<br>
RemoteRegistry: Permite que usuários remotos modificem o Registro neste computador.<br>
RemoteAccess: Oferece conectividade de acesso remoto para clientes de discagem ou VPN.<br>
RemoteDesktopServices: Permite que os usuários se conectem remotamente a este computador.<br>
SharedAccess: Fornece serviços de compartilhamento de conexão com a Internet e firewall.<br>
WindowsInsiderService: Gerencia a participação no Programa Windows Insider.<br>
TabletInputService: Habilita a funcionalidade de caneta e tinta em tablets.<br>
bthserv: Suporta a funcionalidade Bluetooth.<br>
PhoneSvc: Gerencia a integração com smartphones para recursos como chamadas e mensagens.<br>
WbioSrvc: Habilita a coleta e comparação de dados biométricos (ex: impressão digital, reconhecimento facial).<br>
BcastDVRUserService: Suporta a gravação de jogos e a transmissão (Game DVR/Xbox Game Bar).<br>
lfsvc: Fornece serviços de localização geográfica para o dispositivo.<br>

## Como usar
Baixe o arquivo do script (.bat).<br>
Execute como Administrador clicando com o botão direito no arquivo e escolhendo "Executar como Administrador".<br>

O script irá:<br>

Verificar se o Winget está instalado.<br>
Instalar os aplicativos listados.<br>
Remover os bloatware do Windows 11.<br>
Aplicar alterações no registro para desativar telemetria e melhorar a privacidade.<br>

## Requisitos
Gerenciador de pacotes Winget (já vem pré-instalado nas versões recentes do Windows).<br>
Privilégios de Administrador.<br>

## Observações
O script modifica chaves do registro e remove aplicativos internos, então use com cuidado.<br>
As alterações são aplicadas ao usuário atual e configurações do sistema, mas não se aplicam automaticamente a novos perfis de usuário.<br>
Alguns aplicativos e configurações podem variar dependendo da versão do Windows.<br>


---

## Lembrar de ativar manualmente
Game Mode <br>
Hardware-Accelerated GPU Scheduling<br>
otimizações para jogos em janela<br>
Configurações>Privacidade e Segurança>Permissões do Windows e Permissões dos Apps<br>
Mouse 6/10 e Enhance Off<br>
Segurança do Windows>Firewall>Incoming Connections>Block All<br>
Win + R: **SystemPropertiesAdvanced** - Performace(Visual e Memoria Virtual) / Remote(Off)<br>
Mudar plano de energia<br>
DNS over HTTPS<br>
[ASR Rules](https://asrgen.streamlit.app/ASR_Configurator) - Aplicar regras ao Defender<br>

Drivers:<br>
[Amd](https://www.amd.com/pt/support/download/drivers.html)<br>
[Nvidia](https://www.nvidia.com/pt-br/drivers/)<br>
[Intel](https://www.intel.com.br/content/www/br/pt/download-center/home.html)<br>
[Samsung](https://semiconductor.samsung.com/consumer-storage/support/tools/)<br>
[Visual c++](https://learn.microsoft.com/pt-br/cpp/windows/latest-supported-vc-redist?view=msvc-170)<br>

## Recomendação de programas adicionais

1. [WPD](https://wpd.app) - Bloquear a telemetria e os aplicativos do windows 11<br>
2. [OOSU10](https://www.oo-software.com/en/shutup10) - Ferramenta para controlar e desativar funções de telemetria e coleta de dados no Windows.<br>
3. [Revo Uninstaller](https://www.revouninstaller.com/br/revo-uninstaller-free-download/) - Aplicativo para limpar o sistema e também remover aplicativos do sistema<br>
4. [Proton VPN](https://protonvpn.com) - A VPN aprimora a privacidade e a segurança online criptografando a conexão e mascarando sua IP<br>
5. [Autoruns](https://learn.microsoft.com/pt-br/sysinternals/downloads/autoruns) - Utilitário avançado para gerenciar programas que iniciam com o Windows.<br>
6. [Notepad++](https://notepad-plus-plus.org/downloads/) - Editor de texto avançado para programadores e uso geral, com suporte a várias linguagens.<br>

## Lista de sites confiáveis para torrent(Recomendado usar Adblock):

1. https://1337x.to - Torrents no geral, faça o download somente de uploaders confiáveis
2. https://fitgirl-repacks.site - A melhor repacker de jogos da web e a melhor fonte de jogos confiáveis
3. https://byxatab.com - Fonte de jogos confiáveis
4. https://elamigos.site - Fonte de jogos e updates para jogos crackeados
5. https://online-fix.me - Concede soluções para jogar COOP em jogos crackeados

## Assistir séries e filmes PC/Smarthphone

1. Acesse [Stremio](https://www.stremio.com/translation/br)
2. Clique em "Login" no canto superior direito
3. clique em Sign up with email
4. Preencha os campos solicitados
5. Após criar a conta, faça o download do aplicativo e acesse a sua conta
6. Acesse [Torrentio](https://torrentio.strem.fun/configure)
7. Em Providers: Desmarque os providers com RU, FR, IT, ES, MX, PL e Magnet DL
8. Em Sorting: By Seeders
9. Em Exclude qualities/resolutions: Marque para excluir Screner e Cam
10. Clique em Install com o seu aplicativo Stremio aberto e confirme a instalação no aplicativo.

Obs. Para assistir em seu smarthphone basta fazer o download do Stremio e acessar com uma conta que já foi configurada no PC.

---
