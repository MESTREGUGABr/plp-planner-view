class AddTurnoToTarefas < ActiveRecord::Migration[7.1]
  def change
    add_column :tarefas, :turno, :string
  end
end
