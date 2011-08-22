class FinancialStatement < ActiveRecord::Base
  has_many :transactions, :through => :financial_statement_links
  has_many :spendings, :through => :financial_statement_links,
           :source => :transaction, :class_name => 'Spending'
  has_many :earnings, :through => :financial_statement_links,
           :source => :transaction, :class_name => 'Earning'
  has_many :financial_statement_links, :inverse_of => :financial_statement
end
