class Quest < ApplicationRecord

  validates :title, :text, :code, presence: true
end
