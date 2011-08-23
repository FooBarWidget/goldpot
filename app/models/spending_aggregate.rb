class SpendingAggregate
  def initialize(spendings)
    @spendings = spendings
  end
  
  def amount_inc_vat
    sum(:amount_inc_vat_in_cents) / 100.0
  end
  
  def amount_ex_vat
    sum(:amount_ex_vat_in_cents) / 100.0
  end
  
  def vat
    sum(:vat_in_cents) / 100.0
  end

private
  def sum(attr)
    @spendings.inject(0) { |a, b| a + b.send(attr) }
  end
end
