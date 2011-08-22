class MoneyAccount < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Partner', :foreign_key => 'owner_id', :inverse_of => :money_accounts
end
