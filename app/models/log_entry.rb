class LogEntry < ApplicationRecord
  include LogEnums
  belongs_to :baby

  validates :entry_type, presence: true
  validates :logged_at, presence: true

  ENTRY_TYPES = %w[sleep feed diaper walk medical custom]
  MOODS = %w[happy sleepy fussy sick calm]

  validates :entry_type, inclusion: { in: ENTRY_TYPES }
  validates :mood, inclusion: { in: MOODS }, allow_blank: true
end
