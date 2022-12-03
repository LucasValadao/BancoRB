# frozen_string_literal: true

require 'rspec'
require './lib/banking'

describe Conta do

  before :each do
    @conta = Conta.new(Client.new("Test_client"), "Bank")
  end

  describe 'initialize' do
    context 'Must create accounts with different numbers' do
      it 'Check that accounts created consecutively has different numbers' do
        expect(@conta.numero).to be Conta.new(Client.new("Test_client2"), "Bank").numero - 1
      end
    end
  end

  describe '.balanco' do

    context 'Must return the balance of the account' do
      it 'Returns balance of a new account, 0' do
        expect(@conta.balanco).to be 0
      end

      it 'Return the balance of account before add 100' do
        @conta.depositar(100)
        expect(@conta.balanco).to be 100
      end

      it 'Return the balance of account before add 100 and remove 50' do
        @conta.depositar(100)
        @conta.sacar(50)
        expect(@conta.balanco).to be 50
      end
    end

  end

  describe '.depositar' do

    context 'Must add founds to balance of the account' do
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