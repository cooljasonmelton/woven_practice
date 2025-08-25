class LogRecyclingEntryJob < ApplicationJob
  queue_as :default

  def perform(entry_id)
    entry = RecyclingEntry.find(entry_id)
    Rails.logger.info "Recycling entry created: #{entry.material} - #{entry.weight}kg"
  end
end
