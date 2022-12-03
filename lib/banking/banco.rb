# frozen_string_literal: true

class Banco
  @@overdrawn = false

  attr_reader :nome

  def initialize nome
    @nome = nome
    @contas = {}
    @clients = []
    @transferencias = []
  end

  def criarConta client
    conta = Conta.new(client,self)
    raise "Numero de conta duplicado" unless @contas[conta.numero] == nil
    @contas[conta.numero] = conta
    client.addConta(conta)
    conta
  end

  def transferirInterno contaOrigem, contaDestino, valor
    raise "Erro de Transferencia - Conta Origem invalida" if @contas[contaOrigem.numero].nil?
    raise "Erro de Transferencia - Conta Destino invalida" if @contas[contaDestino.numero].nil?

    unless @@overdrawn
      raise "Erro de Transferencia - Saldo insuficiente" if @contas[contaOrigem.numero].balanco < valor
    end

    @contas[contaOrigem.numero].sacar valor
    @contas[contaDestino.numero].depositar valor

    @transferencias << Banco::TransferenciaInterna.new(contaOrigem,contaDestino,valor)

    true
  end

  def historicoTransferencia
    @transferencias
  end
end
