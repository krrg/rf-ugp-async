class PeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people, id: false do |t|
      t.string :id, {primary_key: true}
      t.string :first_name, {index: true}  # Maybe this should've been a partial index?
      t.string :last_name, {index: true}
      t.integer :gender 
      t.boolean :alive
      t.string :lifespan
    end
  end
end

# class GroupsTable < ActiveRecord::Migration[5.1]
#   def change
#     create_table :groups do |t|
#       t.string :name, {index: true}
#       t.text :description
#     end
#   end
# end

