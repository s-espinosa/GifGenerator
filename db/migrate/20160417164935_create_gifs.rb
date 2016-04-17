class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :url
      t.references :category
    end
  end
end
