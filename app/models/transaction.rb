class Transaction < ActiveRecord::Base
  has_many :financial_statement_links, :inverse_of => :transaction
end
