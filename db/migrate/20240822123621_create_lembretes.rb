class CreateLembretes < ActiveRecord::Migration[7.1]
  def change
    create_table :lembretes do |t|
      t.date :data
      t.string :descricao
      t.references :tarefa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
