class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.date :enrollment
      t.integer :contact_method
      t.string :notes
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
