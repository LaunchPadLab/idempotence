class SyncedExternalServiceRecord < ApplicationRecord
  def self.slowly_find_or_create_by(attributes, &block)
    # find_or_create_by is...
    # `find_by(attributes) || create_or_find_by!(attributes, &block)`
    # ...which I'm breaking up with a sleep

    found_by = find_by(attributes)
    
    return found_by if found_by

    sleep 15

    # find_or_create_by then calls create_or_find_by, which is...
    transaction(requires_new: true) { create(attributes, &block) }
  rescue ActiveRecord::RecordNotUnique
    find_by!(attributes)
  end

  def self.upsert_from_external_service(attributes)
    upsert(attributes, unique_by: :external_service_id, returning: %w[ id ], on_duplicate: :update)
  end
end
