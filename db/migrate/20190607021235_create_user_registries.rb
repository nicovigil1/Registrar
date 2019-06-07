class CreateUserRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_registries do |t|
      t.references :registry, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
