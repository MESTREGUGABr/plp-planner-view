class CreateTarefas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarefas do |t|
      t.date :data
      t.string :descricao
      t.integer :bloco
      t.references :status, null: false, foreign_key: true
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
