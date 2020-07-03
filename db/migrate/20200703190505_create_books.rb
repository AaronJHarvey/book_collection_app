class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |b|
      b.string :title
      b.string :author
      b.integer :user_id
  end
end
