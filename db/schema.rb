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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161215080440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coverages", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "monday"
    t.text     "tuesday"
    t.text     "wednesday"
    t.text     "thursday"
    t.text     "friday"
    t.text     "saturday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "monday2"
    t.text     "tuesday2"
    t.text     "wednesday2"
    t.text     "thursday2"
    t.text     "friday2"
    t.text     "saturday2"
    t.text     "monday3"
    t.text     "tuesday3"
    t.text     "wednesday3"
    t.text     "thursday3"
    t.text     "friday3"
    t.text     "saturday3"
    t.text     "monday4"
    t.text     "tuesday4"
    t.text     "wednesday4"
    t.text     "thursday4"
    t.text     "friday4"
    t.text     "saturday4"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "whlocation"
    t.string   "segment"
    t.string   "sellername"
    t.string   "sonumber"
    t.string   "account_id"
    t.string   "account_name"
    t.integer  "case_qty"
    t.integer  "item_qty"
    t.string   "delivery_status"
    t.date     "delivery_date"
    t.datetime "invoice_created_at"
    t.string   "plate_no"
    t.text     "delivery_crew"
    t.datetime "dispatch_datetime"
    t.string   "seal_no"
    t.datetime "datetime_received"
    t.text     "rejection_detail"
    t.string   "invoicenum"
    t.decimal  "invoice_amnt",                precision: 12, scale: 2
    t.text     "remarks"
    t.string   "post_status"
    t.datetime "remittance_date"
    t.string   "payment_mode"
    t.string   "payment_amnt"
    t.datetime "payment_days"
    t.string   "check_no"
    t.date     "check_date"
    t.string   "desc_deduction"
    t.string   "deduction_reference"
    t.string   "decution_amnt"
    t.string   "desc_deduction1"
    t.string   "deduction_reference1"
    t.string   "decution_amnt1"
    t.string   "desc_deduction2"
    t.string   "deduction_reference2"
    t.string   "decution_amnt2"
    t.string   "desc_deduction3"
    t.string   "deduction_reference3"
    t.string   "decution_amnt3"
    t.string   "desc_deduction4"
    t.string   "deduction_reference4"
    t.string   "decution_amnt4"
    t.string   "desc_deduction5"
    t.string   "deduction_reference5"
    t.string   "decution_amnt5"
    t.string   "desc_deduction6"
    t.string   "deduction_reference6"
    t.string   "decution_amnt6"
    t.string   "desc_deduction7"
    t.string   "deduction_reference7"
    t.string   "decution_amnt7"
    t.string   "other_desc_deduction"
    t.string   "other_deduction_reference"
    t.string   "other_decution_amnt"
    t.string   "other_desc_deduction1"
    t.string   "other_deduction_reference1"
    t.string   "other_decution_amnt1"
    t.string   "other_desc_deduction2"
    t.string   "other_deduction_reference2"
    t.string   "other_decution_amnt2"
    t.string   "other_desc_deduction3"
    t.string   "other_deduction_reference3"
    t.string   "other_decution_amnt3"
    t.string   "other_desc_deduction4"
    t.string   "other_deduction_reference4"
    t.string   "other_decution_amnt4"
    t.string   "deduction_sum"
    t.string   "other_deduction_sum"
    t.string   "balance_to_close"
    t.string   "short_over"
    t.boolean  "deduction_add"
    t.boolean  "deduction_add1"
    t.boolean  "deduction_add2"
    t.boolean  "deduction_add3"
    t.boolean  "deduction_add4"
    t.boolean  "deduction_add5"
    t.boolean  "deduction_add6"
    t.boolean  "deduction_add7"
    t.boolean  "other_deduction_add"
    t.boolean  "other_deduction_add1"
    t.boolean  "other_deduction_add2"
    t.boolean  "other_deduction_add3"
    t.boolean  "other_deduction_add4"
    t.string   "post_payment_status"
    t.datetime "remittance_date_1"
    t.string   "payment_mode_1"
    t.string   "payment_amnt_1"
    t.datetime "payment_days_1"
    t.string   "check_no_1"
    t.date     "check_date_1"
    t.string   "desc_deduction_1"
    t.string   "deduction_reference_1"
    t.string   "decution_amnt_1"
    t.string   "desc_deduction1_1"
    t.string   "deduction_reference1_1"
    t.string   "decution_amnt1_1"
    t.string   "desc_deduction2_1"
    t.string   "deduction_reference2_1"
    t.string   "decution_amnt2_1"
    t.boolean  "deduction_add_1"
    t.boolean  "deduction_add1_1"
    t.boolean  "deduction_add2_1"
    t.string   "other_desc_deduction_1"
    t.string   "other_deduction_reference_1"
    t.string   "other_decution_amnt_1"
    t.boolean  "other_deduction_add_1"
    t.string   "deduction_sum_1"
    t.string   "other_deduction_sum_1"
    t.string   "balance_to_close_1"
    t.string   "short_over_1"
    t.string   "post_payment_status_1"
    t.string   "total_deduct"
    t.string   "total_deduct_1"
    t.string   "bank_name"
    t.string   "bank_name_1"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "memos", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "topic"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sellers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_records", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "geolat"
    t.float    "geolng"
    t.float    "geolatout"
    t.float    "geolngout"
  end

  create_table "user_working_hours", force: :cascade do |t|
    t.date     "working_date"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "working_hour_id"
    t.datetime "created_at"
    t.datetime "logout_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.date     "birthday"
    t.date     "starting_date"
    t.string   "role"
    t.string   "gender"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "unique_session_id",      limit: 20
    t.string   "position"
    t.string   "status"
    t.string   "sss_id"
    t.string   "tin_id"
    t.string   "phil_health"
    t.string   "pag_ibig_no"
    t.string   "division"
    t.string   "region"
    t.boolean  "is_active"
    t.string   "civil_status"
    t.string   "employment_type"
    t.string   "seller_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "working_hours", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_time"
    t.integer  "end_time"
  end

  add_foreign_key "coverages", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "memos", "users"
  add_foreign_key "sellers", "users"
  add_foreign_key "time_records", "users"
  add_foreign_key "user_working_hours", "working_hours"
end
