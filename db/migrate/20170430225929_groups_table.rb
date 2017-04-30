class GroupsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, {index: true}
      t.text :description
    end
  end
end
