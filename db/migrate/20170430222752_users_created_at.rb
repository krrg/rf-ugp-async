class UsersCreatedAt < ActiveRecord::Migration[5.1]
  def change
    execute 'ALTER TABLE "users" ADD "created_at" timestamp DEFAULT CURRENT_TIMESTAMP'
  end
end
