# Minha automação pessoal para configuração do Windows 11
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Visão geral
Este script automatiza a instalação de alguns aplicativos usando o Winget, remove aplicativos pré-instalados indesejados do Windows 11 (bloatware) e configura várias opções de privacidade e telemetria para melhorar a segurança e o desempenho do sistema.

## Funcionalidades
Instala aplicativos via Winget (Informações sobre os programas estão em Programas.txt):

Bitwarden, ProtonVPN, Steam, Discord, Navegador Brave, WinRAR, qBittorrent, Microsoft PC Manager, Autoruns, Notepad++, VLC e O&O ShutUp10++

Remove apps comuns pré-instalados no Windows 11 considerados desnecessários ou invasivos.

Desativa IDs de publicidade, telemetria, serviços de localização, reconhecimento de voz, histórico de atividades e outras funções de coleta de dados.

Desliga conteúdos sugeridos no menu Iniciar e na tela de bloqueio.

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

