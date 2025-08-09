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

