class AddExpToTurma < ActiveRecord::Migration[6.0]
  def change
    add_column :turmas, :exp, :float
  end
end
