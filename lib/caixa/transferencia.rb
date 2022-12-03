# frozen_string_literal: true

class Transferencia

  attr_reader :contaOrigem, :contaDestino, :valor

  def initialize contaOrigem, contaDestino, valor
    @contaOrigem = contaOrigem
    @contaDestino = contaDestino
    @valor = valor
  end
end
