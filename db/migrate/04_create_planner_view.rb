class CreatePlannerView < ActiveRecord::Migration[7.1]
  def change
    create_table :planner_views do |t|
      t.string :nome
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
