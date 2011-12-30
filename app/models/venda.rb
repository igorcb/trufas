class Venda < ActiveRecord::Base
  validates_presence_of :cliente_id

  belongs_to :cliente
  belongs_to :produto

  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:qtde].blank? }
  
  scope :venda_diaria, where('DATE(created_at) = ?',Date.today)

  def recebido
    case self.pago 
      when true then 'Sim'
      when false  then 'Nao'
      else 'Nao Definido'
    end	
  end

  def cliente_nome
    cliente.nome if cliente
  end

  def cliente_nome=(nome)
    self.cliente = Cliente.find_or_create_by_nome(nome) unless nome.blank?
  end

  def qtde_items
    qt = 0
    qtde = self.items.to_a.sum do |item|
      qt += item.qtde
    end
    qt
  end

  def total_venda
    qt = 0
    qtde = self.items.to_a.sum do |item|
      qt += item.qtde * item.preco
    end
    qt
  end

end
