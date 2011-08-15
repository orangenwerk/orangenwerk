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

ActiveRecord::Schema.define(:version => 20100912055550) do

  create_table "agbs", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "headline"
    t.text     "inhalt"
    t.string   "paragraf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agbs", ["paragraf"], :name => "index_agbs_on_paragraf"

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "sorter"
    t.string   "bild_file_name"
    t.string   "bild_content_type"
    t.integer  "bild_file_size"
    t.datetime "bild_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titel"
  end

  create_table "branchen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.integer  "sorter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branchen", ["name"], :name => "index_branchen_on_name"

  create_table "faqs", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "frage"
    t.text     "antwort"
    t.integer  "sorter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["name"], :name => "index_faqs_on_name"

  create_table "kontakt_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kontakt_bereiche", ["name"], :name => "index_kontakt_bereiche_on_name"

  create_table "kunden", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.datetime "datum"
    t.integer  "branche_id"
    t.integer  "produkt_bereich_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kunden", ["name"], :name => "index_kunden_on_name"

  create_table "kunden_meinungen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "kunden_name"
    t.string   "firma"
    t.text     "inhalt"
    t.integer  "kunde_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_bereiche", ["name"], :name => "index_news_bereiche_on_name"

  create_table "news_eintraege", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "headline"
    t.datetime "datum"
    t.string   "autor"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_eintraege", ["datum"], :name => "index_news_eintraege_on_datum"
  add_index "news_eintraege", ["name"], :name => "index_news_eintraege_on_name"

  create_table "portfolio_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolio_bereiche", ["name"], :name => "index_portfolio_bereiche_on_name"

  create_table "produkt_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_bereiche", ["name"], :name => "index_produkt_bereiche_on_name"

  create_table "produkt_detail_bilder", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.integer  "produkt_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_detail_bilder", ["produkt_id"], :name => "index_produkt_detail_bilder_on_produkt_id"

  create_table "produkt_kategorien", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.integer  "produkt_bereich_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_kategorien", ["name"], :name => "index_produkt_kategorien_on_name"
  add_index "produkt_kategorien", ["produkt_bereich_id"], :name => "index_produkt_kategorien_on_produkt_bereich_id"

  create_table "produkte", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.text     "beschreibung"
    t.integer  "produkt_kategorie_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "produktbild_file_name"
    t.string   "produktbild_content_type"
    t.integer  "produktbild_file_size"
    t.datetime "produktbild_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkte", ["name"], :name => "index_produkte_on_name"
  add_index "produkte", ["produkt_kategorie_id"], :name => "index_produkte_on_produkt_kategorie_id"

  create_table "referenz_bilder", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.integer  "sorter"
    t.integer  "referenz_id"
    t.string   "bild_file_name"
    t.string   "bild_content_type"
    t.integer  "bild_file_size"
    t.datetime "bild_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referenz_bilder", ["referenz_id"], :name => "index_referenz_bilder_on_referenz_id"

  create_table "referenzen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.string   "objekt"
    t.string   "ort"
    t.boolean  "webref",               :default => false
    t.integer  "branche_id"
    t.integer  "produkt_bereich_id"
    t.integer  "produkt_kategorie_id"
    t.integer  "produkt_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "datum"
  end

  add_index "referenzen", ["branche_id"], :name => "index_referenzen_on_branche_id"
  add_index "referenzen", ["produkt_bereich_id"], :name => "index_referenzen_on_produkt_bereich_id"
  add_index "referenzen", ["produkt_id"], :name => "index_referenzen_on_produkt_id"
  add_index "referenzen", ["produkt_kategorie_id"], :name => "index_referenzen_on_produkt_kategorie_id"

  create_table "sliders", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "sorter"
    t.string   "bild_file_name"
    t.string   "bild_content_type"
    t.integer  "bild_file_size"
    t.datetime "bild_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titel"
    t.string   "von_horizontal"
    t.string   "von_vertikal"
    t.string   "von_zoom"
    t.string   "zu_horizontal"
    t.string   "zu_vertikal"
    t.string   "zu_zoom"
    t.integer  "dauer"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.boolean  "strangemaster",      :default => false
    t.boolean  "autor",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"

  create_table "web_referenz_bilder", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.integer  "sorter"
    t.integer  "web_referenz_id"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "web_referenz_bilder", ["web_referenz_id"], :name => "index_web_referenz_bilder_on_web_referenz_id"

  create_table "web_referenzen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.integer  "referenz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "web_referenzen", ["name"], :name => "index_web_referenzen_on_name"
  add_index "web_referenzen", ["referenz_id"], :name => "index_web_referenzen_on_referenz_id"

end
