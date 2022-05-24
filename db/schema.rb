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

ActiveRecord::Schema.define(version: 20220523103222) do

  create_table "accounts", force: :cascade do |t|
    t.float    "coin",        default: 0.0,       null: false
    t.float    "freeze_coin", default: 0.0,       null: false
    t.float    "commission",  default: 0.0,       null: false
    t.string   "status",      default: "disable", null: false
    t.string   "password",    default: "",        null: false
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["phone"], name: "index_admin_users_on_phone", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "article_contents", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.text     "desc"
    t.string   "tag",        default: "", null: false
    t.integer  "article_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "lang",       default: "", null: false
    t.string   "title",      default: "", null: false
    t.string   "vol",        default: "", null: false
    t.string   "desc",       default: "", null: false
    t.text     "category"
    t.string   "address",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "file",       default: "", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "area",       default: "", null: false
    t.string   "name",       default: "", null: false
    t.text     "info"
    t.string   "lnt",        default: "", null: false
    t.string   "lat",        default: "", null: false
    t.string   "logo",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "consumes", force: :cascade do |t|
    t.string   "number"
    t.string   "category",       default: "none", null: false
    t.float    "coin_cost",      default: 0.0,    null: false
    t.float    "coin_now"
    t.string   "status",         default: "none", null: false
    t.integer  "user_id"
    t.integer  "demand_id"
    t.integer  "trade_order_id"
    t.integer  "citrine_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.text     "info"
    t.integer  "factory_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "device_workers", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_wxusers", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "wx_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "idno",       default: "",  null: false
    t.string   "name",       default: "",  null: false
    t.string   "mdno",       default: "",  null: false
    t.string   "unit",       default: "",  null: false
    t.date     "out_date"
    t.date     "mount_date"
    t.string   "supplier",   default: "",  null: false
    t.string   "mfcture",    default: "",  null: false
    t.string   "pos",        default: "",  null: false
    t.string   "pos_no",     default: "",  null: false
    t.float    "life",       default: 0.0, null: false
    t.string   "qrcode_uid"
    t.string   "state",      default: "",  null: false
    t.text     "desc"
    t.string   "avatar",     default: "",  null: false
    t.integer  "factory_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title",          default: "", null: false
    t.string   "html_link",      default: "", null: false
    t.integer  "status",         default: 0,  null: false
    t.integer  "mth_pdt_rpt_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "enclosures", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "file",           default: "", null: false
    t.integer  "notice_id"
    t.integer  "article_id"
    t.integer  "ocr_id"
    t.integer  "ctg_mtrl_id"
    t.integer  "task_id"
    t.integer  "task_report_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string   "area",       default: "",  null: false
    t.string   "name",       default: "",  null: false
    t.text     "info"
    t.string   "lnt",        default: "",  null: false
    t.string   "lat",        default: "",  null: false
    t.float    "design",     default: 0.0, null: false
    t.float    "plan",       default: 0.0, null: false
    t.string   "logo",       default: "",  null: false
    t.integer  "company_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "fct_workers", force: :cascade do |t|
    t.integer  "factory_id"
    t.integer  "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fct_wxusers", force: :cascade do |t|
    t.integer  "factory_id"
    t.integer  "wx_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gdservices", force: :cascade do |t|
    t.string   "key",        default: "", null: false
    t.string   "name",       default: "", null: false
    t.string   "sid",        default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "gdteminals", force: :cascade do |t|
    t.string   "name",         default: "", null: false
    t.string   "tid",          default: "", null: false
    t.text     "desc"
    t.integer  "wx_user_id"
    t.integer  "gdservice_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "gdtraces", force: :cascade do |t|
    t.string   "trid",         default: "", null: false
    t.string   "trname",       default: "", null: false
    t.integer  "task_log_id"
    t.integer  "gdteminal_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string   "name"
    t.string   "data_type"
    t.string   "title"
    t.string   "tag"
    t.boolean  "required"
    t.integer  "template_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nests", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.integer  "template_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.text     "content"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ocrs", force: :cascade do |t|
    t.integer  "ocr_type",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number"
    t.string   "category",    default: "none",    null: false
    t.float    "money"
    t.float    "coin"
    t.integer  "status",      default: 0,         null: false
    t.string   "subject"
    t.string   "trade_no"
    t.string   "total_fee"
    t.string   "buyer_email"
    t.datetime "gmt_create"
    t.datetime "gmt_payment"
    t.text     "notify_msg"
    t.integer  "price"
    t.integer  "quantity"
    t.string   "state",       default: "opening", null: false
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "patrolers", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "phone",      default: "", null: false
    t.string   "password",   default: "", null: false
    t.string   "avatar",     default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.string   "subject_class", default: "", null: false
    t.string   "action",        default: "", null: false
    t.integer  "subject_id",    default: 0,  null: false
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "tag",        default: "", null: false
    t.boolean  "required"
    t.integer  "nest_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "relates", force: :cascade do |t|
    t.string   "relate_type"
    t.string   "obj"
    t.integer  "template_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "role_permissionships", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.string   "level",         default: "", null: false
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "selectors", force: :cascade do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "file",       default: true, null: false
    t.string   "title",      default: "",   null: false
    t.string   "category",   default: "",   null: false
    t.integer  "spider_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spiders", force: :cascade do |t|
    t.string   "link",         default: "",   null: false
    t.boolean  "doc_save",     default: true, null: false
    t.boolean  "doc_parse",    default: true, null: false
    t.text     "header"
    t.string   "cookie",       default: "",   null: false
    t.string   "agent",        default: "",   null: false
    t.string   "content_type", default: "",   null: false
    t.string   "page",         default: "",   null: false
    t.string   "file",         default: "",   null: false
    t.string   "referer",      default: "",   null: false
    t.string   "host",         default: "",   null: false
    t.string   "redirection",  default: "",   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "task_logs", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "state",      default: "", null: false
    t.integer  "task_id"
    t.integer  "wx_user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "task_reports", force: :cascade do |t|
    t.float    "longitude",  default: 0.0, null: false
    t.float    "latitude",   default: 0.0, null: false
    t.string   "state",      default: "",  null: false
    t.string   "question",   default: "",  null: false
    t.text     "img"
    t.integer  "task_id"
    t.integer  "device_id"
    t.integer  "wx_user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "task_wxusers", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "wx_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.date     "task_date",  default: '2022-05-24', null: false
    t.text     "des"
    t.string   "state",      default: "ongoing",    null: false
    t.integer  "factory_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.string   "cn_name"
    t.string   "nest"
    t.boolean  "image"
    t.boolean  "attachment"
    t.string   "one_image"
    t.string   "one_attachment"
    t.boolean  "index"
    t.boolean  "new"
    t.boolean  "edit"
    t.boolean  "show"
    t.boolean  "form"
    t.boolean  "js"
    t.boolean  "upload"
    t.boolean  "download"
    t.boolean  "scss"
    t.boolean  "admin"
    t.boolean  "current_user"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "upholds", force: :cascade do |t|
    t.date     "uphold_date"
    t.text     "reason"
    t.text     "content"
    t.float    "cost",        default: 0.0, null: false
    t.string   "state",       default: "",  null: false
    t.string   "avatar",      default: "",  null: false
    t.integer  "device_id"
    t.integer  "factory_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_depts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_fcts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "factory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "identity",               default: "", null: false
    t.string   "alipay",                 default: "", null: false
    t.integer  "status",                 default: 0,  null: false
    t.string   "number",                 default: "", null: false
    t.string   "authc_number"
    t.string   "qr_code_uid"
    t.string   "inviter",                default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "parent_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.integer  "company_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "workers", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.string   "idno",        default: "", null: false
    t.string   "phone",       default: "", null: false
    t.string   "gender",      default: "", null: false
    t.string   "state",       default: "", null: false
    t.string   "adress",      default: "", null: false
    t.string   "desc",        default: "", null: false
    t.string   "avatar",      default: "", null: false
    t.string   "idfront",     default: "", null: false
    t.string   "idback",      default: "", null: false
    t.text     "avatar_base"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "wx_users", force: :cascade do |t|
    t.string   "unionid",    default: "",        null: false
    t.string   "openid",     default: "",        null: false
    t.string   "name",       default: "",        null: false
    t.string   "phone",      default: "",        null: false
    t.string   "nickname",   default: "",        null: false
    t.string   "avatarurl",  default: "",        null: false
    t.string   "gender",     default: "",        null: false
    t.string   "city",       default: "",        null: false
    t.string   "province",   default: "",        null: false
    t.string   "country",    default: "",        null: false
    t.string   "language",   default: "",        null: false
    t.string   "state",      default: "ongoing", null: false
    t.string   "task_state", default: "pending", null: false
    t.integer  "factory_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
