class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.integer :article_id
      t.integer :public_id

      t.timestamps
    end
  end
end
