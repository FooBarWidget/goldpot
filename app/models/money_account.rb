class MoneyAccount < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Partner', :foreign_key => 'owner_id', :inverse_of => :money_accounts
  has_many :transactions, :inverse_of => :money_account
end
