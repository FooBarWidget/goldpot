class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string     :type, :null => false
      t.timestamps :null => false
      t.integer    :amount_ex_vat, :null => false
      t.integer    :vat, :null => false, :default => 0
      t.text       :comments
      
      # Meaning depends on type
      t.integer    :kind
      
      # Spending-specific fields
      t.integer    :vendor_country
      t.integer    :vendor_vat_number
      t.boolean    :opvoerbaar
      t.boolean    :depreciable
      
      # Earning-specific fields
      t.integer    :buyer_country
      t.integer    :buyer_kind
    end
  end
end
