class CreateUserRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_registries do |t|
      t.references :registry_id, foreign_key: true
      t.references :user_id, foreign_key: true
    end
  end
end
