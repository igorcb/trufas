class ClientesController < ApplicationController
  def index
    @clientes = Cliente.order('nome')
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

end
