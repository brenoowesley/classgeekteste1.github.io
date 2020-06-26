class JoinTableTurmaUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :turmas, :users do |t|
      t.index [:turma_id, :user_id], :unique => true
      # t.index [:user_id, :turma_id], :unique => true 
    end
  end
end
