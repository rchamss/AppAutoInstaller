<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/d9b9bc0e-f1cd-4834-8d53-43e076b0da80" />



# AppAutoInstaller 🤓

Um script de instalação automática de aplicativos para Windows, desenvolvido em PowerShell, com foco em agilizar processos de formatação, padronização de ambientes e preparação de máquinas.

O projeto verifica automaticamente quais aplicativos já estão instalados no sistema e instala apenas os que estiverem ausentes. **Suporte somente para instaladores locais `.exe` ou `.msi`.**

## 👾 Funcionalidades

- O script realiza a instalação automatica de todos os aplicativos presentes na pasta designada.
- Verifica se os aplicativos instalados ja estão presentes, permitindo a auditoria na padronização de maquinas.
- Suporte a instaladores `.exe` e `.msi`
- Estrutura portátil, podendo ser utilizado em pendrives.

## 😉 Guia de Utilização
O script não precisa de configurações para funcionar em ambientes diversos. Contudo, alguns ajustes precisam ser feitos e verificados para sua utilização.

A seguir listo os principais pontos que você precisará se preocupar ao utilizar o script.

### Mantenha todos os arquivos principais na estrutura correta e não mude seus nomes.
Ao baixar a pasta com os arquivos do script, você encontrará o seguintes ítens:
  1. Pasta `APPS`: Pasta designada para conter os instaladores dos aplicativos.
  2. `AppInstaler.ps1`: Script PowerShell com toda a automação. Você pode checar tanto aqui quanto no bloco de notas, se desejar.
  3. `AppInstalerRUN.cmd`: Esse é o arquivo que deverá ser executado. Ele solicitará por credenciais de administrador por padrão para instalar os aplicativos.

**Construí essa automação para procurar esses ítens dentro do diretório rais, onde se encontra o `AppInstaler.ps1`. Qualquer alteração nas suas localizações e nomes pode quebrar a busca na primeira parte do script.**

### Renomeie os arquivos `.exe` e `.msi` para o nome do aplicativo final.
A maneira que o script verifica o aplicativo final se baseia na forma que ele se apresenta para o comptuador. 

Vamos utilizar o navegador de internet Brave como exemplo:
  - O instalador do Brave geralmente vem em um padrão como esse: `BraveBrowserSetup-BRV011.exe`. Contudo, se você procurar pelo aplicativo instalado no painel de controle, encontrará apenas como `Brave`. Por isso você precisará renomear o arquivo de instalação para `Brave.exe`. Dessa forma o script poderá verificar se esse app já está instalado.
  - Não precisa se preocupar com a versão do app ou nomes muito grandes. Normalmente quando estamos verificando o nome do aplicativo instalado no painel de controle, veremos que alguns apps apresentam o nome da versão atual em sua composição total. Ajustei isso para ele conseguir verificar o nome do app listado, mesmo que seja muito extenso ou mude com frequencia. Utilizemos o Winrar como exemplo: Ao procurar pelo app no painel de controle, ele se apresenta como `Winrar 1.0`. Nesse caso você pode renomear o arquivo apenas para `Winrar.exe` e ele conseguirá verificar qualquer nome que tiver Winrar em sua composição, mesmo se o app instalado seja `Winrar the ultimate file menager`

## 😅 Considerações Finais
Esse foi um pequeno projeto que desenvolvi para me ajudar a automatizar um processo que realizo frequentemente. Espero não precisar fazer muitas alterações e ajustes nele, contudo ficarei muito grato em ouvir feedbacks e sujestões!
