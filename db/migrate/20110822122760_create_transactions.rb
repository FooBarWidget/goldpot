class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string     :type, :null => false
      t.timestamps :null => false
      t.integer    :amount_ex_vat
      t.integer    :vat
      t.integer    :style
      t.text       :comments
      
      
      ### Fields for which the meaning depends on the type
      
      t.integer    :kind
      
      # Spendings: the money account that financed this spending.
      # Earnings : the money account that this earning was put into.
      t.integer    :money_account_id, :on_update => :cascade, :on_delete => :no_action
      
      
      ### Spending-specific fields
      
      t.integer    :vendor_country
      t.integer    :vendor_vat_number
      t.integer    :opvoerbaarheid_ppm
      t.boolean    :depreciable
      
      
      ### Earning-specific fields
      
      t.integer    :buyer_country
      t.integer    :buyer_kind
    end
  end
end
