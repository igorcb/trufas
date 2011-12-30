class ProdutosController < ApplicationController
  def index
    @produtos = Produto.all
  end

end
