class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string     :name, :null => false
      t.text       :comments
      t.timestamps :null => false
    end
  end
end
