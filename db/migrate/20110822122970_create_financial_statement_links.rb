class CreateFinancialStatementLinks < ActiveRecord::Migration
  def change
    create_table :financial_statement_links do |t|
      t.integer    :financial_statement_id, :null => false, :on_update => :cascade, :on_delete => :cascade
      t.integer    :transaction_id, :null => false, :on_update => :cascade, :on_delete => :cascade
      t.integer    :version, :null => false
      t.timestamps :null => false
    end
  end
end
