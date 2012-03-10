class Produto < ActiveRecord::Base
  has_many :items, :dependent => :restrict

  def resumo_por_produto_diario
     Produto.joins(:items).where('items.produto_id = ? and DATE(items.created_at) = ?', self.id, Date.today).sum('items.qtde*items.preco')
  end

end
