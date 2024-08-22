class CreateMeta < ActiveRecord::Migration[7.1]
  def change
    create_table :meta do |t|
      t.date :data_inicio
      t.date :data_fim
      t.string :descricao
      t.references :status, null: false, foreign_key: true
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
