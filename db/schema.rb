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

ActiveRecord::Schema.define(:version => 20110227142749) do

  create_table "agbs", :force => true do |t|
    t.string   "name"
    t.string   "headline"
    t.text     "inhalt"
    t.string   "paragraf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "agbs", ["paragraf"], :name => "index_agbs_on_paragraf"

  create_table "aktionen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "link_name"
    t.string   "link_url"
    t.boolean  "aktiv"
    t.boolean  "link"
    t.boolean  "zeitlimit"
    t.datetime "von"
    t.datetime "bis"
    t.string   "bild_file_name"
    t.string   "bild_content_type"
    t.integer  "bild_file_size"
    t.datetime "bild_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "all_area"
  end

  add_index "aktionen", ["name"], :name => "index_aktionen_on_name"

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

  create_table "banners_kontakt_bereiche", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "kontakt_bereich_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_kontakt_bereiche", ["banner_id"], :name => "index_banners_kontakt_bereiche_on_banner_id"
  add_index "banners_kontakt_bereiche", ["kontakt_bereich_id"], :name => "index_banners_kontakt_bereiche_on_kontakt_bereich_id"

  create_table "banners_news_bereiche", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "news_bereich_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_news_bereiche", ["banner_id"], :name => "index_banners_news_bereiche_on_banner_id"
  add_index "banners_news_bereiche", ["news_bereich_id"], :name => "index_banners_news_bereiche_on_news_bereich_id"

  create_table "banners_produkt_bereiche", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "produkt_bereich_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_produkt_bereiche", ["banner_id"], :name => "index_banners_produkt_bereiche_on_banner_id"
  add_index "banners_produkt_bereiche", ["produkt_bereich_id"], :name => "index_banners_produkt_bereiche_on_produkt_bereich_id"

  create_table "banners_produkt_kategorien", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "produkt_kategorie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_produkt_kategorien", ["banner_id"], :name => "index_banners_produkt_kategorien_on_banner_id"
  add_index "banners_produkt_kategorien", ["produkt_kategorie_id"], :name => "index_banners_produkt_kategorien_on_produkt_kategorie_id"

  create_table "banners_produkte", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "produkt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_produkte", ["banner_id"], :name => "index_banners_produkte_on_banner_id"
  add_index "banners_produkte", ["produkt_id"], :name => "index_banners_produkte_on_produkt_id"

  create_table "banners_seiten", :force => true do |t|
    t.integer  "banner_id"
    t.integer  "seite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners_seiten", ["banner_id"], :name => "index_banners_seiten_on_banner_id"
  add_index "banners_seiten", ["seite_id"], :name => "index_banners_seiten_on_seite_id"

  create_table "branchen", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branchen", ["name"], :name => "index_branchen_on_name"

  create_table "faqs", :force => true do |t|
    t.string   "name"
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
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
  end

  add_index "kontakt_bereiche", ["name"], :name => "index_kontakt_bereiche_on_name"

  create_table "kontakt_kategorien", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.text     "inhalt"
    t.integer  "sorter"
    t.integer  "kontakt_bereich_id"
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kontakt_kategorien", ["kontakt_bereich_id"], :name => "index_kontakt_kategorien_on_kontakt_bereich_id"
  add_index "kontakt_kategorien", ["name"], :name => "index_kontakt_kategorien_on_name"

  create_table "kunden", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.datetime "datum"
    t.integer  "branche_id"
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
    t.string   "kunden_name"
    t.string   "firma"
    t.text     "inhalt"
    t.integer  "kunde_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kunden_produkt_bereiche", :force => true do |t|
    t.integer  "kunde_id"
    t.integer  "produkt_bereich_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kunden_produkt_bereiche", ["kunde_id"], :name => "index_kunden_produkt_bereiche_on_kunde_id"
  add_index "kunden_produkt_bereiche", ["produkt_bereich_id"], :name => "index_kunden_produkt_bereiche_on_produkt_bereich_id"

  create_table "leistungen", :force => true do |t|
    t.string   "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leistungen_produkt_bereiche", :force => true do |t|
    t.integer  "leistung_id"
    t.integer  "produkt_bereich_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leistungen_produkt_bereiche", ["leistung_id"], :name => "index_leistungen_produkt_bereiche_on_leistung_id"
  add_index "leistungen_produkt_bereiche", ["produkt_bereich_id"], :name => "index_leistungen_produkt_bereiche_on_produkt_bereich_id"

  create_table "leistungen_produkte", :force => true do |t|
    t.integer  "leistung_id"
    t.integer  "produkt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "leistungen_produkte", ["leistung_id"], :name => "index_leistungen_produkte_on_leistung_id"
  add_index "leistungen_produkte", ["position"], :name => "index_leistungen_produkte_on_position"
  add_index "leistungen_produkte", ["produkt_id"], :name => "index_leistungen_produkte_on_produkt_id"

  create_table "news_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
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

  create_table "newsletter_abos", :force => true do |t|
    t.string   "geschlecht"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "newsletter_abos", ["email"], :name => "index_newsletter_abos_on_email"

  create_table "portfolio_bereiche", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
  end

  add_index "portfolio_bereiche", ["name"], :name => "index_portfolio_bereiche_on_name"

  create_table "portfolio_bereiche_sliders", :force => true do |t|
    t.integer  "portfolio_bereich_id"
    t.integer  "slider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolio_bereiche_sliders", ["portfolio_bereich_id"], :name => "index_portfolio_bereiche_sliders_on_portfolio_bereich_id"
  add_index "portfolio_bereiche_sliders", ["slider_id"], :name => "index_portfolio_bereiche_sliders_on_slider_id"

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
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
  end

  add_index "produkt_bereiche", ["name"], :name => "index_produkt_bereiche_on_name"

  create_table "produkt_bereiche_referenzen", :force => true do |t|
    t.integer  "produkt_bereich_id"
    t.integer  "referenz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_bereiche_referenzen", ["produkt_bereich_id"], :name => "index_produkt_bereiche_referenzen_on_produkt_bereich_id"
  add_index "produkt_bereiche_referenzen", ["referenz_id"], :name => "index_produkt_bereiche_referenzen_on_referenz_id"

  create_table "produkt_bereiche_sidebars", :force => true do |t|
    t.integer  "produkt_bereich_id"
    t.integer  "sidebar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_bereiche_sidebars", ["produkt_bereich_id"], :name => "index_produkt_bereiche_sidebars_on_produkt_bereich_id"
  add_index "produkt_bereiche_sidebars", ["sidebar_id"], :name => "index_produkt_bereiche_sidebars_on_sidebar_id"

  create_table "produkt_bereiche_sliders", :force => true do |t|
    t.integer  "produkt_bereich_id"
    t.integer  "slider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_bereiche_sliders", ["produkt_bereich_id"], :name => "index_produkt_bereiche_sliders_on_produkt_bereich_id"
  add_index "produkt_bereiche_sliders", ["slider_id"], :name => "index_produkt_bereiche_sliders_on_slider_id"

  create_table "produkt_detail_bilder", :force => true do |t|
    t.string   "name"
    t.integer  "sorter"
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
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
  end

  add_index "produkt_kategorien", ["name"], :name => "index_produkt_kategorien_on_name"
  add_index "produkt_kategorien", ["produkt_bereich_id"], :name => "index_produkt_kategorien_on_produkt_bereich_id"

  create_table "produkt_kategorien_referenzen", :force => true do |t|
    t.integer  "produkt_kategorie_id"
    t.integer  "referenz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkt_kategorien_referenzen", ["produkt_kategorie_id"], :name => "index_produkt_kategorien_referenzen_on_produkt_kategorie_id"
  add_index "produkt_kategorien_referenzen", ["referenz_id"], :name => "index_produkt_kategorien_referenzen_on_referenz_id"

  create_table "produkte", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.integer  "sorter"
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
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
    t.string   "beispiel_produkt"
    t.string   "beispiel_beschreibung"
    t.string   "beispiel_preis"
    t.string   "beispiel_style_klasse"
    t.string   "produkt_url"
    t.string   "sku",                       :default => ""
    t.string   "meta_description",          :default => ""
    t.string   "meta_keywords",             :default => ""
  end

  add_index "produkte", ["name"], :name => "index_produkte_on_name"
  add_index "produkte", ["produkt_kategorie_id"], :name => "index_produkte_on_produkt_kategorie_id"
  add_index "produkte", ["sku"], :name => "index_produkte_on_sku"

  create_table "produkte_referenzen", :force => true do |t|
    t.integer  "produkt_id"
    t.integer  "referenz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produkte_referenzen", ["produkt_id"], :name => "index_produkte_referenzen_on_produkt_id"
  add_index "produkte_referenzen", ["referenz_id"], :name => "index_produkte_referenzen_on_referenz_id"

  create_table "referenz_bilder", :force => true do |t|
    t.string   "name"
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
    t.string   "objekt"
    t.string   "ort"
    t.boolean  "webref",            :default => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "datum"
    t.integer  "branche_id"
  end

  create_table "seiten", :force => true do |t|
    t.string   "name"
    t.string   "titel"
    t.string   "headline"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sidebar_icon_file_name"
    t.string   "sidebar_icon_content_type"
    t.integer  "sidebar_icon_file_size"
    t.datetime "sidebar_icon_updated_at"
    t.string   "meta_description",          :default => ""
    t.string   "meta_keywords",             :default => ""
  end

  add_index "seiten", ["name"], :name => "index_seiten_on_name"

  create_table "seiten_sidebars", :force => true do |t|
    t.integer  "seite_id"
    t.integer  "sidebar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seiten_sidebars", ["seite_id"], :name => "index_seiten_sidebars_on_seite_id"
  add_index "seiten_sidebars", ["sidebar_id"], :name => "index_seiten_sidebars_on_sidebar_id"

  create_table "sidebars", :force => true do |t|
    t.string   "name"
    t.integer  "sorter"
    t.string   "headline"
    t.string   "klasse"
    t.string   "geber"
    t.text     "inhalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "start_head_sliders", :force => true do |t|
    t.string   "name"
    t.integer  "sorter"
    t.string   "headline"
    t.text     "inhalt"
    t.string   "bild_file_name"
    t.string   "bild_content_type"
    t.integer  "bild_file_size"
    t.datetime "bild_updated_at"
    t.integer  "seite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "start_head_sliders", ["seite_id"], :name => "index_start_head_sliders_on_seite_id"

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
    t.string   "url"
  end

  add_index "web_referenzen", ["name"], :name => "index_web_referenzen_on_name"
  add_index "web_referenzen", ["referenz_id"], :name => "index_web_referenzen_on_referenz_id"

end
