class FinancialStatementLink < ActiveRecord::Base
  belongs_to :financial_statement, :inverse_of => :financial_statement_links
  belongs_to :transaction, :inverse_of => :financial_statement_links
end
