# frozen_string_literal: true

require 'rspec'

require './lib/caixa'

describe Banco do

  before :each do
    @banco = Banco.new( "Teste_Banco" )
    @outro_banco = Banco.new( "Outro_Banco" )
    @client1 = Client.new("Teste_cliente1")
    @client2 = Client.new("Teste_cliente2")
    @client3 = Client.new("Teste_cliente3")
    @conta1 = @banco.criarConta(@client1)
    @conta2 = @banco.criarConta(@client2)
    @conta3 = @outro_banco.criarConta(@client3)
  end

  describe 'initialize' do
    context 'Banco vazio' do
      it 'criar Banco' do
        expect(@banco).not_to be_nil
      end

    end
  end

  describe 'criarConta' do
    context 'Criar conta com sucesso' do
      it 'Criar conta com cliente' do
        expect(@client1.contas).not_to be_empty
      end

    end
  end

  describe 'transferirInterno' do
    context 'Transferencia entre contas' do
      it 'Falha, sem saldo' do
        expect{@banco.transferirInterno @conta1, @conta2, 100}.to raise_error(RuntimeError)
      end
      it 'Sucesso' do
        @conta1.depositar(100)
        expect(@banco.transferirInterno @conta1, @conta2, 100).to be true
        expect(@conta1.balanco).to be 0
        expect(@conta2.balanco).to be 100
      end
    end
  end
end