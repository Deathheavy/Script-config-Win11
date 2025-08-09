# Minha automação pessoal para configuração do Windows 11
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Visão geral
Este script automatiza a instalação de alguns aplicativos usando o Winget, remove aplicativos pré-instalados indesejados do Windows 11 (bloatware) e configura várias opções de privacidade e telemetria para melhorar a segurança e o desempenho do sistema.

## Funcionalidades
Instala aplicativos via Winget

Programas instalados com o script:
**Obs. Se você não usa algum dos programas basta remover em aplicativos**

Bitwarden — Gerenciador de senhas seguro e de código aberto para armazenar e gerar senhas.
ProtonVPN — Serviço de VPN com versão gratuita focado em privacidade e segurança online.
Steam — Plataforma digital para compra e gerenciamento de jogos
Discord — Aplicativo de comunicação por voz, vídeo e texto
Brave Browser — Navegador focado em privacidade, bloqueia anúncios e rastreadores automaticamente.
WinRAR — Programa para compactar e descompactar arquivos em vários formatos.
qBittorrent — Cliente de torrent leve e de código aberto para download de arquivos P2P.
Microsoft PC Manager — Ferramenta da Microsoft para otimização e gerenciamento do sistema.
Autoruns — Utilitário avançado para gerenciar programas que iniciam com o Windows.
Notepad++ — Editor de texto avançado para programadores e uso geral, com suporte a várias linguagens.
VLC — Reprodutor multimídia versátil que suporta praticamente todos os formatos de vídeo e áudio.
O&O ShutUp10++ — Ferramenta para controlar e desativar funções de telemetria e coleta de dados no Windows.

Remove apps comuns pré-instalados no Windows 11 considerados desnecessários ou invasivos.

Desativa IDs de publicidade, telemetria, serviços de localização, reconhecimento de voz, histórico de atividades e outras funções de coleta de dados.

Desliga conteúdos sugeridos no menu Iniciar e na tela de bloqueio.

Remove a Cortana e desativa o Copilot e o Recall

Configura a dns do sistema para a da Cloudflare(1.1.1.1 / 1.0.0.1)

Desativa os serviços a seguir:
**Obs. Se você usa algum dos serviços basta ativar novamente em services.msc**

DiagTrack: Habilita o serviço de rastreamento de diagnósticos e telemetria para o Windows.
RetailDemo: Gerencia o modo de demonstração para varejo em dispositivos.
DiagnosticPolicyService: Habilita a detecção, solução de problemas e resolução de problemas no Windows.
SysMain: Otimiza o desempenho do sistema através do pré-carregamento de aplicativos (Superfetch/SysMain).
Fax: Permite enviar e receber documentos de fax.
MapsBroker: Gerencia o acesso a serviços de mapas e localização.
WSearch: Habilita o serviço de indexação para pesquisa de arquivos.
WMPNetworkSvc: Compartilha bibliotecas de mídia do Windows Media Player com outros dispositivos na rede.
SCardSvr: Gerencia o acesso a leitores de cartão inteligente.
PrintSpooler: Gerencia a fila de documentos para impressão.
RemoteRegistry: Permite que usuários remotos modificem o Registro neste computador.
RemoteAccess: Oferece conectividade de acesso remoto para clientes de discagem ou VPN.
RemoteDesktopServices: Permite que os usuários se conectem remotamente a este computador.
SharedAccess: Fornece serviços de compartilhamento de conexão com a Internet e firewall.
WindowsInsiderService: Gerencia a participação no Programa Windows Insider.
TabletInputService: Habilita a funcionalidade de caneta e tinta em tablets.
bthserv: Suporta a funcionalidade Bluetooth.
PhoneSvc: Gerencia a integração com smartphones para recursos como chamadas e mensagens.
WbioSrvc: Habilita a coleta e comparação de dados biométricos (ex: impressão digital, reconhecimento facial).
BcastDVRUserService: Suporta a gravação de jogos e a transmissão (Game DVR/Xbox Game Bar).
lfsvc: Fornece serviços de localização geográfica para o dispositivo.

## Como usar
Baixe o arquivo do script (.bat).
Execute como Administrador clicando com o botão direito no arquivo e escolhendo "Executar como Administrador".

O script irá:

Verificar se o Winget está instalado.
Instalar silenciosamente os aplicativos listados.
Remover os apps bloatware do Windows 11.
Aplicar alterações no registro para desativar telemetria e privacidade.

## Requisitos
Gerenciador de pacotes Winget (já vem pré-instalado nas versões recentes do Windows).
Privilégios de Administrador.

## Observações
O script modifica chaves do registro e remove aplicativos internos, então use com cuidado.
As alterações são aplicadas ao usuário atual e configurações do sistema, mas não se aplicam automaticamente a novos perfis de usuário.
Alguns aplicativos e configurações podem variar dependendo da versão do Windows.

---

