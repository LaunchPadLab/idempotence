
class SyncedExternalServiceRecord < ApplicationRecord

  # SyncedExternalServiceRecord.upsert_from_external_service(external_service_id: "abcd", arbitrary_other_external_field: "Howdy!")
  def self.upsert_from_external_service(attributes)
    upsert(attributes, unique_by: :external_service_id, returning: %w[ id ], on_duplicate: :update)
  end

end
