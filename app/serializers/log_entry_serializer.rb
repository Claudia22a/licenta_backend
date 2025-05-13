class LogEntrySerializer < ActiveModel::Serializer
  attributes :id, :entry_type, :logged_at, :notes, :duration, :amount, :unit,
             :location, :mood, :diaper_type, :feeding_type, :sleep_type,
             :walk_type, :symptom_type, :tag_type, :other_diaper_type,
             :other_feeding_type, :other_sleep_type, :other_walk_type,
             :other_symptom_type, :other_tag_type, :start_time, :end_time, :title
end
