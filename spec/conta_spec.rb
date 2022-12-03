# frozen_string_literal: true

require 'rspec'
require './lib/caixa'

describe Conta do

  before :each do
    @conta = Conta.new(Client.new("Test_client"), "Bank")
  end

  describe 'initialize' do
    context 'Contas devem ser feitas com numeros diferentes' do
      it 'Checar se contas feitas consecutivamente tem numeros diferentes' do
        expect(@conta.numero).to be Conta.new(Client.new("Test_client2"), "Bank").numero - 1
      end
    end
  end

  describe '.balanco' do

    context 'Retornar o balanco da conta' do
      it 'Retorna o balanco da conta nova, 0' do
        expect(@conta.balanco).to be 0
      end

      it 'Retorna o balanco da conta depois de add 100' do
        @conta.depositar(100)
        expect(@conta.balanco).to be 100
      end

      it 'Retorna o balanco da conta depois de add 100 e tirar 50' do
        @conta.depositar(100)
        @conta.sacar(50)
        expect(@conta.balanco).to be 50
      end
    end

  end

  describe '.depositar' do

    context 'Adicionando saldo a conta' do
      it 'Add 0' do
        @conta.depositar(0)
        expect(@conta.balanco).to be 0
      end

      it 'Add 100' do
        @conta.depositar(100)
        expect(@conta.balanco).to be 100
      end
    end
  end

end