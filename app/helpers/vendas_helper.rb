module VendasHelper
  def qtde_total_diaria
    total = 0
    #vendas = Venda.venda_diaria
    vendas = Venda.where('DATE(created_at) = ?',Date.today).order('created_at')
    vendas.each do |venda|
      venda.items.to_a.sum do |item|
        total += item.qtde
      end
    end
    total
  end

  def qtde_total_diaria_recebido
    total = 0
    #vendas = Venda.venda_diaria.where(:pago => true)	
    vendas = Venda.where('DATE(created_at) = ? and pago = ?',Date.today, true).order('created_at')
    vendas.each do |venda|
      venda.items.to_a.sum do |item|
        total += item.qtde
      end
    end
    total
  end
end
