class CreateMessages < ActiveRecord::Migration
  def change
  	create_table "messages", force: true do |t|
	    t.text     "body"
	  end
  end
end