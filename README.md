# RottenPotatoes

RottenPotatoes é um sistema web para gerenciamento de filmes, desenvolvido em Ruby on Rails 8. O objetivo é permitir o cadastro, consulta, edição e exclusão de filmes, além de oferecer recursos avançados de busca, ordenação, filtros e paginação.

## Funcionalidades

- Cadastro, listagem, edição e remoção de filmes (CRUD completo)
- Ordenação da listagem por título ou data de lançamento
- Filtro por ratings (classificação indicativa), com múltipla seleção
- Persistência dos filtros e ordenação via sessão do usuário
- Busca por título de filme (campo de busca na tela principal)
- Paginação dos resultados com Kaminari (10 filmes por página)
- Layout responsivo e moderno utilizando Bootstrap 5

## Requisitos

- Ruby >= 3.2
- Rails >= 8.0
- SQLite3
- Node.js
- Yarn

## Instalação e Execução

1. Clone o repositório:
   ```sh
   git clone https://github.com/gabrielcaixeta01/Engenharia-de-Software.git
   cd Engenharia-de-Software/hw2
   ```
2. Instale as dependências:
   ```sh
   bundle install
   yarn install --check-files
   ```
3. Configure e crie o banco de dados:
   ```sh
   bin/rails db:setup
   ```
4. Inicie o servidor:
   ```sh
   bin/rails s
   ```
5. Acesse o sistema em [http://localhost:3000/movies](http://localhost:3000/movies)

## Rodando os Testes

O projeto utiliza RSpec para testes automatizados.

Execute todos os testes com:

```sh
bundle exec rspec
```

## Estrutura Principal

- `app/models/movie.rb`: modelo Movie, com validações e métodos auxiliares
- `app/controllers/movies_controller.rb`: controller principal, lógica de CRUD, filtros, busca, ordenação e paginação
- `app/views/movies/`: views para listagem, formulários e exibição de filmes
- `app/views/kaminari/`: partials customizados para paginação com Bootstrap 5
- `db/seeds.rb`: dados de exemplo para popular o banco

## Deploy

O projeto pode ser facilmente implantado em serviços como Heroku, Render ou Railway.

### Heroku

1. Crie um app no Heroku e configure as variáveis de ambiente necessárias.
2. Faça deploy do código:
   ```sh
   git push heroku main
   heroku run bin/rails db:migrate
   heroku run bin/rails db:seed
   ```

### Render

1. Crie um novo serviço web no Render apontando para o repositório.
2. Configure o build command para `bundle install && yarn install --check-files && bin/rails db:migrate && bin/rails db:seed`.
3. Configure o start command para `bin/rails s`.

### Railway

1. Importe o repositório no Railway.
2. Configure os comandos de build e start conforme acima.

Consulte a documentação oficial de cada plataforma para detalhes de variáveis de ambiente e configurações específicas.
