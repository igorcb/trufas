module VendasHelper
  def qtde_total_diaria
    total = 0
    vendas = Venda.venda_diaria
    vendas.each do |venda|
      venda.items.to_a.sum do |item|
        total += item.qtde
      end
    end
    total
  end

  def qtde_total_diaria_recebido
    total = 0
    vendas = Venda.venda_diaria.where(:pago => true)	
    vendas.each do |venda|
      venda.items.to_a.sum do |item|
        total += item.qtde
      end
    end
    total
  end
end
