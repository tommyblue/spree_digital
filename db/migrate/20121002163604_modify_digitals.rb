class AddFileUrlToDigitals < ActiveRecord::Migration

  def change
    add_column :spree_digitals, :file_url, :string

    remove_column :spree_digitals, :attachment_file_name
    remove_column :spree_digitals, :attachment_content_type
    remove_column :spree_digitals, :attachment_file_size

    add_index :spree_digitals, :file_url
  end

end

