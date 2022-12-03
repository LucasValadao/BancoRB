# frozen_string_literal: true

require 'rspec'

require './lib/banking'



describe Client do

  before :each do
    @client = Client.new("Teste_cliente")
  end

  describe 'initialize' do
    context 'Criar novo cliente' do
      it 'Cliente com nome Teste_cliente' do
        expect(@client.nome).to eq "Teste_cliente"
      end
      it 'Cliente sem contas' do
        expect(@client.contas).to be_empty
      end
    end
  end

  describe '.addConta' do
    context 'Adicionar conta para o cliente' do
      it 'Adicionar somente uma conta para o cliente' do
        banco = Banco.new("Teste_banco")
        conta = banco.criarConta(@client)
        expect(@client.contas).to include(conta)
      end
    end
  end

end
