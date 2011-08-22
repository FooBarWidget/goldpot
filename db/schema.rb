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

  create_table "transactions", :force => true do |t|
    t.string   "type",                             :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "amount_ex_vat",                    :null => false
    t.integer  "vat",               :default => 0, :null => false
    t.text     "comments"
    t.integer  "kind"
    t.integer  "vendor_country"
    t.integer  "vendor_vat_number"
    t.boolean  "opvoerbaar"
    t.boolean  "depreciable"
    t.integer  "buyer_country"
    t.integer  "buyer_kind"
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
