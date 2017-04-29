class UsersTable < ActiveRecord::Migration[5.1]
  def change
    
    create_table :users, id: false do |t|
      t.string :id, {index: true, null: false}
      t.string :email, {index: true}
      t.timestamps
    end

  end
end
