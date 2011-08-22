class CreateMoneyAccounts < ActiveRecord::Migration
  def change
    create_table :money_accounts do |t|
      t.string     :name, :null => false
      t.integer    :owner_id, :null => false, :references => [:partner, :id], :on_update => :cascade, :on_delete => :cascade
      t.text       :comments
      t.timestamps :null => false
    end
  end
end
