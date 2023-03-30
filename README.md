# Teste da Agence
=======
# Acessando o aplicativo

Inicialmente, baixar o aplativo como ZIP e descompatar em alguma pasta do seu computador ou efetuar o clone do repostiróio;

Executar os comandos: 
## flutter clean
Para limpar qualquer dependencia de origem.

## flutter pub get 
Para baixar as dependencias utilizadas no aplicativo.

# Solução apresentada

## Estrutura do Projeto
O teste foi utilizado o padrão do GetX_Pattern, onde apresenta uma arquitetura mais limpa e objetiva para o propósito do teste. Os modules estão divididos em Bindings, Controllers e Views.

## Gerencia de Estados
Para o Gerenciamento de Estado foi utilizado o GetX.

##Injeção de Dependência
Foi utilizdo o Get para o DI.

## Lógica da aplicação
Para a autenticação de login com o Google o Facebook, foram criadas suas APIs públicas dentro do Firebase, onde lá é capaz de gerir a entrada dos usuários na aplicação. O Facebook é gerenciado pelo Meta, que por sua vez também é colocado seu ID Application e a Secret dentro do Firebase.
Já dentro da aplicação foram criados dois serviços separados para essa requisição.
O mesmo serve para o Google Maps, onde sua implementação foi utilizando o recurso do Google Maps.

Todos esses elementos estão utilizando meu SHA-1 do meu debugkey.

## Layout da aplicação
O layout foi pensado no padrão de cores do site web da Agence, onde utilizei alguns recursos para captura da palheta e assim montar o layout padrão do aplicativo, e a montagem foi feita pela própria criatividade.

## Considerações finais
Por fim, agradeço pelo teste, apesar de objetivo, explora vários conhecimentos técnicos. Espero que gostem! :)
