class Note < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5}

  def self.can_add_more_notes?
    count < 5
  end
end
