class Item < ActiveRecord::Base
  belongs_to :venda
  belongs_to :produto

  #validates_presence_of :qtde, :preco

  #validates_numericality_of :qtde, :only_integer => true
  #validates_numericality_of :qtde, :greater_than => 0

  before_save :getpreco

  def getpreco
    p = Produto.find(self.produto_id)
    self.preco = p.preco.to_f
    #puts ">>>>>>>>>>>>>>>>>>>>>>>>>>> passou no metodo getpreco" 
  end

  def valor_total
    self.preco.to_f * self.qtde
  end
end
