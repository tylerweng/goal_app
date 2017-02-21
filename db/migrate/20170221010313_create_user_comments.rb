class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :body, null: false
      t.integer :poster_id, null: false
      t.integer :postee_id, null: false
      t.timestamps null: false
    end
  end
end
