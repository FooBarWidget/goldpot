class CreateFinancialStatements < ActiveRecord::Migration
  def change
    create_table :financial_statements do |t|
      t.string     :name, :null => false
      t.integer    :version, :null => false
      t.timestamps :null => false
    end
  end
end
