class Baby < ApplicationRecord
  belongs_to :user

  validates :name, :birth_date, presence: true
end
