class CreateParticipantRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_registries do |t|
      t.references :registry, foreign_key: true
      t.references :participant, foreign_key: true
      t.date "enrollment"
    end
  end
end
