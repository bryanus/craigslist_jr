class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title 
      t.text :description
      t.decimal :price
      t.string :email
      t.string :post_url
      t.references :category
      t.timestamps
    end  
  end
end
