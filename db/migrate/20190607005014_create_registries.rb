class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.boolean :open, default: true

      t.timestamps
    end
  end
end
