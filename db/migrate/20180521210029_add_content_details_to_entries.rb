class AddContentDetailsToEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :content, :string
    add_column :entries, :content_physical, :string
    add_column :entries, :rating_physical, :integer
    add_column :entries, :content_emotional, :string
    add_column :entries, :rating_emotional, :integer
    add_column :entries, :content_intellectual, :string
    add_column :entries, :rating_intellectual, :integer
  end
end
