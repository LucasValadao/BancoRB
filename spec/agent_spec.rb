# frozen_string_literal: true

require 'rspec'
require './lib/caixa'

describe Agent do

  before :each do
    @banco = Banco.new( "Teste_Banco" )
    @outro_banco = Banco.new( "Outro_Banco" )
    @client1 = Client.new("Teste_cliente1")
    @client2 = Client.new("Teste_cliente2")
    @conta1 = @banco.criarConta(@client1)
    @conta2 = @outro_banco.criarConta(@client2)
    @conta3 = @banco.criarConta(@client2)
  end
  describe Transferencia do
    context 'Transferencia entre duas contas' do
      it 'Sucesso' do
        @conta1.depositar 50000
        Agent.new().transferir @conta1, @conta3, 20000
        expect(@conta1.balanco).to be (50000 - 20000 )
        expect(@conta3.balanco).to be 20000
      end
      it 'Falhou, sem saldo' do
        @conta1.depositar 50000
        expect{Agent.new().transferir @conta1, @conta3, 200000}.to raise_error
      end

    end
  end
end
