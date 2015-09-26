class CartItem < SimpleDelegator
  attr_reader :loan, :quantity

  def initialize(item, quantity)
    @loan = item
    @quantity = quantity
  end

  def subtotal
    @loan.price * @quantity
  end
end
