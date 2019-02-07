class CreateLinks < ActiveRecord::Migration[5.1]
  
  def change
    create_table :links do |t|
      t.text :title
      t.string :url
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
