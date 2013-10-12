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

ActiveRecord::Schema.define(:version => 20130930084551) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "bills", :force => true do |t|
    t.string   "title"
    t.string   "sponsors"
    t.string   "status"
    t.string   "bill_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "bill_text_file_name"
    t.string   "bill_text_content_type"
    t.integer  "bill_text_file_size"
    t.datetime "bill_text_updated_at"
    t.string   "summary"
    t.string   "gdoc_location"
  end

  create_table "petitions", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "threshold"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "signatures_count"
  end

  create_table "reports", :force => true do |t|
    t.integer  "bill_id"
    t.string   "report_id"
    t.string   "author"
    t.string   "title"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "report_text_file_name"
    t.string   "report_text_content_type"
    t.integer  "report_text_file_size"
    t.datetime "report_text_updated_at"
  end

  add_index "reports", ["bill_id"], :name => "index_reports_on_bill_id"

  create_table "signatures", :force => true do |t|
    t.integer  "petition_id"
    t.string   "name"
    t.string   "hall"
    t.string   "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "signatures", ["petition_id"], :name => "index_signatures_on_petition_id"

  create_table "votes", :force => true do |t|
    t.integer  "petition_id"
    t.string   "name"
    t.string   "hall"
    t.string   "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "votes", ["petition_id"], :name => "index_votes_on_petition_id"

end
