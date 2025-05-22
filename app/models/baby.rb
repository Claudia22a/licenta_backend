class Baby < ApplicationRecord
  belongs_to :user
  has_many :log_entries, dependent: :destroy
  has_many :measurements, dependent: :destroy

  validates :name, :birth_date, presence: true
  accepts_nested_attributes_for :measurements
end
