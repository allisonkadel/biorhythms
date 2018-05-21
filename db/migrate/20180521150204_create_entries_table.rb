class CreateEntriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :content_physical
      t.integer :rating_physical
      t.string :content_emotional
      t.integer :rating_emotional
      t.string :content_inrake dbtellectual
      t.integer :rating_intellectual
      t.integer :user_id
      t.timestamps
    end
  end
end
