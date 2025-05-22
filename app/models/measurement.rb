class Measurement < ApplicationRecord
  belongs_to :baby

  validates :weight, :height, :head_circumference, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
