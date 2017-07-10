class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
