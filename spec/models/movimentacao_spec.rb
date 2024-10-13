require 'rails_helper'

RSpec.describe Movimentacao, type: :model do
  it do
    usuario = User.create email: 'joao@email.com', password: '123456'
    movimentacao =  Movimentacao.new valor: 1500.00, tipo: :entrada, descricao: 'Deposito de conta de luz', data: Date.current, user: usuario

    expect(movimentacao.valid?).to be(true)
  end
end

# require 'rails_helper'

# Rspec.describe Movimentacao, type: :model do
#   let(:movimentacao) { create :movimentacao }

#   it do
#     expect(movimentacao.valid?).to be_truthy
#   end

#   it do
#     expect(movimentacao.id).not_to be_nil
#   end
# end
