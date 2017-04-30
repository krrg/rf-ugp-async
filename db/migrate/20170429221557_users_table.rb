class UsersTable < ActiveRecord::Migration[5.1]
  def change
    
    create_table :users, id: false do |t|
      t.string :id, {primary_key: true}
      t.string :email, {null: false, index: true}
    end

  end
end
