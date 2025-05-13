class Baby < ApplicationRecord
  belongs_to :user
  has_many :log_entries, dependent: :destroy

  validates :name, :birth_date, presence: true
end
