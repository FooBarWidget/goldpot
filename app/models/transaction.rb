class Transaction < ActiveRecord::Base
  belongs_to :folder, :inverse_of => :transactions
  belongs_to :money_account, :inverse_of => :transactions
  
  def amount_ex_vat
    if amount_ex_vat_in_cents
      amount_ex_vat_in_cents / 100.0
    else
      nil
    end
  end
  
  def amount_ex_vat=(value)
    if value
      self.amount_ex_vat_in_cents = (value.to_f * 100).to_i
    else
      self.amount_ex_vat_in_cents = nil
    end
  end
  
  def vat
    if vat_in_cents
      vat_in_cents / 100.0
    else
      nil
    end
  end
  
  def vat=(value)
    if value
      self.vat_in_cents = (value.to_f * 100).to_i
    else
      self.vat_in_cents = nil
    end
  end
  
  def amount_inc_vat
    if amount_inc_vat_in_cents
      amount_inc_vat_in_cents / 100.0
    else
      nil
    end
  end
  
  def amount_inc_vat_in_cents
    if amount_ex_vat_in_cents
      amount_ex_vat_in_cents - (vat_in_cents || 0)
    else
      nil
    end
  end
end
