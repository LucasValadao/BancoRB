# frozen_string_literal: true

class Client
  attr_reader :nome, :contas

  def initialize nome
    @nome = nome
    @contas = []
  end

  def addConta conta
    @contas << conta
  end
end
