require 'test_helper'

class VendasTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Vendas.new.valid?
  end
end
