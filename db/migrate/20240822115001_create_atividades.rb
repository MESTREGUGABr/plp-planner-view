class CreateAtividades < ActiveRecord::Migration[7.1]
  def change
    create_table :atividades do |t|
      t.string :name
      t.string :descricao
      t.integer :prioridade
      t.date :data
      t.references :status, null: false, foreign_key: true
      t.references :planner_view, null: false, foreign_key: true

      t.timestamps
    end
  end
end
