# SBF mini e-commerce - teste Flutter

Neste repositório consta a aplicação móvel  para o teste do Grupo SBF desenvolvida em Flutter/Dart.


## O Projeto

O projeto consta com um mini e-commerce que tem as seguintes funções:

- Exibir dados de promoções aos usuários, vindas de uma *API*.
- Exibição de carrinho de compras: Itens selecionados, subtotal da compra, desconto da compra, total da compra.
- Controle de carrinho de compras: Adicionar item, Adicionar quantidade de item, Remover item, Remover quantidade de item.
- Realizar a "compra" dos produtos selecionados.
- A funcionalidade de buscar produtos não foi desenvolvida por preferência do aplicador do teste.


**ATENÇÃO: A aplicação só funcionará corretamente se o servidor responsável pela _API_ estiver em execução**

## Arquitetura

Foi escolhida a _Clean Architecture_ para desenvolvimento deste projeto.
A decisão foi pela **ótima** estruturação e a viabilidade de fazer testes **frequentes** e assertivos.

![Imagem Clean Architecture](https://miro.medium.com/max/800/1*0R0r00uF1RyRFxkxo3HVDg.png)

(Imagem exemplo da arquitetura utilizada)

## Testes

Testes frequentes e que tiveram que ser refatorados diversas vezes para atender novas demandas e pensamentos durante o desenvolvimento são a base deste projeto.
Foram feitos testes unitários para as camadas de domínio, externas e infra. 

Para acessar e testar os testes:

Na pasta raíz do projeto, acesse o terminal e digite o seguinte comando:
> ```flutter test```

Ou acesse a área de testes em sua IDE e clique no botão para executar todos os testes.

Imagem de exemplo executando testes via terminal:

![image](https://user-images.githubusercontent.com/63029527/180894230-99c05da9-0721-40bd-8838-ae7958747080.png)


Imagem de exemplo executando testes com VSCode:

![image](https://user-images.githubusercontent.com/63029527/180894351-e66ffa4c-554d-4911-9ae0-91bec65c6ada.png)


## UI/UX

O layout deste projeto é fornecido via FIGMA e pode ser encontrado [acessando este link](https://www.figma.com/file/EHnLOmhHnWfquuVfVduaMD/Teste-App)
As cores principais da aplicação são vermelho e branco(respectivamente, `#E30000` e `#FFFFFF`)

## Tecnologias escolhidas

**ATENÇÃO: está seção está repleta de opiniões que tive durante o desenvolvimento, não representado verdade absoluta mas apenas minha visão sobre as escolhas que fiz durante o desenvolvimento deste projeto**

### Gerenciador de estados (o mais esperado de todos os tempos)

Para este projeto foi utilizada a gerência de estado com
> _ValueNotifier_ e o padrão _state_

Por conter no próprio Flutter, o ValueNotifier entrega uma solução rica sem depender da pacotes externos, desenvolvido por outras equipes.
Além de sua simplicidade e desempenho, é muito simples um novo desenvolvedor conhecer ValueNotifier (ou se não conhecer, aprender) do que esperar um desenvolvedor próprio para o projeto. 

Já o padrão state foi escolhido pelo mesmo motivo, é **organizado** e intuitivo.
Numa equipe com muitos desenvolvedores é essencial uma alta organização, assim como _clean architecture_... O padrão _state_.


### HTTP Client

Apesar de **Ser extremamente necessário** criar um HttpClient para este projeto urgentemente, foi utilizado o

> [Dio](https://pub.dev/packages/dio)

Bem documentado, com erros customizados e bem atualizado.


### Storage Local

Para storage local foi escolhido o 

> [SharedPreferences](https://pub.dev/packages/shared_preferences)

O SharedPreferences já é usado há bastante tempo pelos desenvolvedores Flutter, é bem documentado e tenho muita prática com o mesmo. Além de sua performance ser "aceitável"

### Gerenciador de Dependências

Simplesmente:

> [Get_it](https://pub.dev/packages/get_it)

### Gerenciador de Rotas

> [RouteMaster](https://pub.dev/packages/routemaster)

## Para futuros desenvolvedores:

### Estilização

Todos os estilos devem ser criados em seus respectivos arquivos seguindo as regras já contidas neles em

> lib/presentation/style

### Novas regras de negócio

Novas regras devem ser adicionadas utilizando clean architecture, mais precisamente na camada de *domínio*, utilizando casos de uso (_usecases_) e testes.

### Informações importantes

1- Como o SharedPreferences não é compatível com objetos customizados, os objetos são convertidos em string e separados por **|** antes de serem salvos. Para recuperação do valor salvo, a operação inversa é executada.

Para mais informações veja o arquivo:

> lib/infra/adapters/cart_item_adapter.dart


2- _A adicionar..._


## Como testar o projeto?

### Executando:

No terminal digite:

> ```flutter run --release```


Testes:

> ```flutter test```


**ATENÇÃO: O SERVIDOR WEB API DEVE ESTAR DISPONÍVEL LOCALMENTE E NA PORTA 3000.


