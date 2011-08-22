class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string     :name, :null => false, :index => :unique
      t.text       :comments
      t.timestamps :null => false
    end
  end
end
