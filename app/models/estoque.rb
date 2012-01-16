class Estoque < ActiveRecord::Base
  belongs_to :produto

  validates :produto_id, :qtde, :presence => true
  
  scope :diario, where('DATE(created_at) = ?',Date.today)
end
