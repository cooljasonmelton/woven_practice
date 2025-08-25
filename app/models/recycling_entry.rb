class RecyclingEntry < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true, numericality: { greater_than: 0 }

  after_create :enqueue_logging_job

  private

  def enqueue_logging_job
    LogRecyclingEntryJob.perform_later(self.id)
  end
end
