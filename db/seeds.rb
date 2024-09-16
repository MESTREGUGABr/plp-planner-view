# db/seeds.rb

Tarefa.delete_all
Categoria.delete_all
Status.delete_all
Categoria.create([
  { nome: 'Tarefas Diárias' },
  { nome: 'Prazo de Entrega' },
  { nome: 'Aulas' },
  { nome: 'Trabalhos' },
  { nome: 'Revisões' },
  { nome: 'Provas' },
  { nome: 'Exercícios' },
  { nome: 'Saúde' },
  { nome: 'Hobbies' },
  { nome: 'Tempo em Família' },
  { nome: 'Contas a Pagar' },
  { nome: 'Orçamento' },
  { nome: 'Investimentos' },
  { nome: 'Metas de Longo Prazo' },
  { nome: 'Metas de Curto Prazo' },
  { nome: 'Hábitos' },
  { nome: 'Viagens' },
  { nome: 'Filmes/Séries' },
  { nome: 'Eventos Sociais' }
])

Status.create([
  { nome: 'Pendente' },
  { nome: 'Em Andamento' },
  { nome: 'Concluído' }
])
