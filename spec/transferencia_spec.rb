# frozen_string_literal: true

require 'rspec'
require './lib/banking'

describe Transferencia do
  before :all do
    @transferir = Transferencia.new(1,2,100)
  end

  describe 'initialize' do
    context 'Nova transferencia' do

      it 'Conta de Origem da Transferencia' do
        expect(@transferir.contaOrigem).to be 1
      end
      it 'Conta de Destino da Transferencia' do
        expect(@transferir.contaDestino).to be 2
      end
      it 'Valor da Transferencia' do
        expect(@transferir.valor).to be 100
      end
    end
  end

end
