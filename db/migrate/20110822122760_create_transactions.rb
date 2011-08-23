class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string     :type, :null => false
      t.integer    :folder_id, :null => false, :on_update => :cascade, :on_delete => :cascade
      t.timestamps :null => false
      
      t.date       :date
      t.integer    :amount_ex_vat_in_cents
      t.integer    :vat_in_cents
      t.text       :comments
      t.integer    :color, :null => false, :default => 0
      t.integer    :background_color, :null => false, :default => 0
      t.boolean    :bold, :null => false, :default => false
      t.boolean    :italic, :null => false, :default => false
      
      
      ### Fields for which the meaning depends on the type
      
      # Spendings: the money account that financed this spending. Can be null,
      #            meaning unknown, in which case the costs should be split among
      #            all partners.
      # Earnings : the money account that this earning was put into.
      t.integer    :money_account_id, :on_update => :cascade, :on_delete => :no_action
      
      
      ### Spending-specific fields
      
      t.string     :spending_kind
      t.integer    :vendor_country
      t.integer    :vendor_vat_number
      t.integer    :opvoerbaarheid_ppm
      t.boolean    :depreciable
      
      
      ### Earning-specific fields
      
      t.integer    :earning_kind
      t.integer    :buyer_country
      t.integer    :buyer_kind
    end
  end
end
