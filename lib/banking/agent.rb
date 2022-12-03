# frozen_string_literal: true

class Agent
  def transferir de, para, valor
    raise "Erro Transferencia - contas incorretas" if de.banco.nil? || para.banco.nil?

    raise "Erro de Transferencia - A conta origem nao tem saldo suficiente" if de.balance < valor
    de.banco.transferirInterno de, para, valor
  end
end
