class AddRedirectUrlToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :redirect_url, :string
  end
end
