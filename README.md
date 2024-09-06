# Tratando o CRUD de tarefas para cada usuário logado

Observei que aparece uma mensagem descrita abaixo na tela de lançamento de crédito em conta ou despesas.

********************************************************
1 error prohibited this movimentacao from being saved:

    User é obrigatório(a)

********************************************************

* Atualmente o programa lista as tarefas anteriores de me logar como um novo usuário.

* Apesar de ter criado um Devise para autenticar, ainda faltam ajustes.

* Assistir o 3º vídeo para identificar onde ajusto a rotina que separa tarefas por usuário logado.

* Identifiquei uma incompabilidade do rails 7.2 com o Devise-tailwindcssed.

* O Lucas me orientou pelo telegram a retornar uma branch anterior.

* Fiz essa orientação e ignorei a reinstalação da gem devise-Tailwindcssed.

* "rails", "~> 7.2.1"

* Started POST "/movimentacoes" for 127.0.0.1 at 2024-09-06 18:28:51 -0300
* Processing by MovimentacoesController#create as TURBO_STREAM
* Parameters: {"authenticity_token"=>"[FILTERED]", "movimentacao"=>{"tipo"=>"saida", "data"=>"2024-09-06", "descricao"=>"Passagem de avião", "valor"=>"600"}, "commit"=>"Criar Movimentação"}
* User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["id", 1], ["LIMIT", 1]]
* Rendering layout layouts/application.html.erb
* Rendering movimentacoes/new.html.erb within layouts/application
* Rendered movimentacoes/_form.html.erb (Duration: 2.4ms | GC: 0.3ms)
* Rendered movimentacoes/new.html.erb within layouts/application (Duration: 2.7ms | GC: 0.3ms)
* Rendered layout layouts/application.html.erb (Duration: 8.0ms | GC: 0.7ms)
* Completed 422 Unprocessable Content in 13ms (Views: 8.5ms | ActiveRecord: 0.4ms (1 query, 0 cached) | GC: 0.7ms)

https://github.com/manoelcarlobertin/app-financas

# Tratando o problema

* Ajustei o relacionamento nos models User(has_many :movimentacoes) e Movimentacao(belongs_to :user).

* Criei em movimentaçoes_controller uma função private que une a relação das tabelas users e movimentacoes.
