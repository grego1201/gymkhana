class Quest < ApplicationRecord

  validates :title, :text, presence: true
end
