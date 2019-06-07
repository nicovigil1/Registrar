class CreateParticipantRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_registries do |t|
      t.references :registry_id, foreign_key: true
      t.references :participant_id, foreign_key: true
    end
  end
end
