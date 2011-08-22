# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822122970) do

  create_table "financial_statements", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "version",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.index ["name"], :name => "index_partners_on_name", :unique => true
  end

  create_table "money_accounts", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "owner_id"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.index ["owner_id", "name"], :name => "index_money_accounts_on_owner_id_and_name", :unique => true
    t.index ["owner_id"], :name => "index_money_accounts_on_owner_id"
    t.foreign_key ["owner_id"], "partners", ["id"], :on_update => :cascade, :on_delete => :cascade
  end

  create_table "transactions", :force => true do |t|
    t.string   "type",                                      :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.date     "date"
    t.integer  "amount_ex_vat_in_cents"
    t.integer  "vat_in_cents"
    t.text     "comments"
    t.integer  "color",                  :default => 0,     :null => false
    t.integer  "background_color",       :default => 0,     :null => false
    t.boolean  "bold",                   :default => false, :null => false
    t.boolean  "italic",                 :default => false, :null => false
    t.integer  "money_account_id"
    t.string   "spending_kind"
    t.integer  "vendor_country"
    t.integer  "vendor_vat_number"
    t.integer  "opvoerbaarheid_ppm"
    t.boolean  "depreciable"
    t.integer  "earning_kind"
    t.integer  "buyer_country"
    t.integer  "buyer_kind"
    t.index ["money_account_id"], :name => "index_transactions_on_money_account_id"
    t.foreign_key ["money_account_id"], "money_accounts", ["id"], :on_update => :cascade, :on_delete => :no_action
  end

  create_table "financial_statement_links", :force => true do |t|
    t.integer  "financial_statement_id", :null => false
    t.integer  "transaction_id",         :null => false
    t.integer  "version",                :null => false
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.index ["transaction_id"], :name => "index_financial_statement_links_on_transaction_id"
    t.index ["financial_statement_id"], :name => "index_financial_statement_links_on_financial_statement_id"
    t.foreign_key ["financial_statement_id"], "financial_statements", ["id"], :on_update => :cascade, :on_delete => :cascade
    t.foreign_key ["transaction_id"], "transactions", ["id"], :on_update => :cascade, :on_delete => :cascade
  end

end
