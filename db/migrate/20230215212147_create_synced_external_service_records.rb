class CreateSyncedExternalServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :synced_external_service_records do |t|
      t.string :external_service_id
      t.string :arbitrary_other_external_field
      t.datetime :synced_at

      t.timestamps
    end
  end
end
