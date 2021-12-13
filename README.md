![N|Solid](logo_ioasys.png)

# Desafio Pessoa Desenvolvedora iOS

## 🏗  O que fazer?
Você deve fazer um fork deste repositório, criar o código e ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso, nós iremos avaliar e retornar por e-mail o resultado do seu teste. 

## 📱Escopo de projeto
Deve ser criado um aplicativo iOS utilizando Swift com as seguintes especificações:

* Login e acesso de Usuário já registrado
    * Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
    * Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;
* Busca de Empresas
* Listagem de Empresas
* Detalhamento de Empresas

**Sinta-se a vontade para:**

* Escolher a arquitetura
* Usar ou não usar bibliotecas
* Estruturar seu layout com storyboards, xibs, view code (UIKit ou SwiftUI).

## 🕵 Itens a serem avaliados
Pense no desafio como uma oportunidade de mostrar todo o seu conhecimento. Independente de onde conseguiu chegar no teste, é importante disponibilizar sua implementação para analisarmos.

* Estrutura do projeto
* Consumo de APIs
* Lógicas de busca
* Estruturação de layout e fluxo de aplicação
* Utilização de código limpo e princípios SOLID
* Boas práticas da linguagem

## 🎁 Extra
Estes itens não são obrigatórios, porém desejados.

* Testes unitários
* Testes de UI
* Modularização

## 🚨 Informações Importantes
* Layout e recortes disponíveis no Figma (https://bit.ly/testeempresasios)
* Você deve fazer um cadastro no Figma para ter acesso ao layout.
* Integração disponível a partir de uma collection para Postman (https://www.getpostman.com/apps) disponível neste repositório.

## Dados para Teste
* Servidor: https://empresas.ioasys.com.br/api
* Versão da API: v1
* Usuário de Teste: testeapple@ioasys.com.br
* Senha de Teste : 12341234