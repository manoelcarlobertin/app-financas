class Movimentacao < ApplicationRecord
  enum :tipo, { saida: "saida", entrada: "entrada" }

  belongs_to :user

  # validates :data, presence: true
  validates :data, comparison: { less_than_or_equal_to: proc { Date.current } }
  validates :descricao, presence: true
  validates :descricao, length: { maximum: 150 }
  validates :valor, presence: true
  validates :tipo, presence: true

  validate :valida_se_existe_saldo

  def self.saldo_atual
    self.entrada.sum(:valor) - self.saida.sum(:valor)
  end

  private

  def valida_se_existe_saldo
    return if entrada?
    return if valor.to_f <= Movimentacao.saldo_atual
    # if valor.present? && valor > Movimentacao.saldo_atual # poderia "valor.to_f" cast pra float.
    # pra validar tem que ser uma entrada e valor menor que o saldo atual, caso contrário ERROR.
    errors.add :valor, "NÃO HÁ SALDO SUFICIENTE."
  end
end
