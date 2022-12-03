# frozen_string_literal: true

class TransferenciaInterna < Transferencia

  def initialize de, para, valor
    @de = de
    @para = para
    @valor = valor
  end
end
