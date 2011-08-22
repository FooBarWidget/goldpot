class Partner < ActiveRecord::Base
  has_many :money_accounts, :inverse_of => :owner, :foreign_key => 'owner_id'
end
