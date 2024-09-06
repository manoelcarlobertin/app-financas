class AddUserToMovimentacoes < ActiveRecord::Migration[7.2]
  def change
    add_reference :movimentacoes, :user, null: true, foreing_key: true
  end
end
