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
end
