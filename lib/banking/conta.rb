# frozen_string_literal: true

class Conta
  @@ultimoNumeroConta = 0

  attr_reader :balanco, :numero, :banco

  def initialize client, banco
    @client = client
    @balanco = 0
    @@ultimoNumeroConta += 1
    @numero = @@ultimoNumeroConta
    @banco = banco
  end

  def depositar valor
    @balanco += valor
  end

  def sacar valor
    @balanco -= valor
  end
end
