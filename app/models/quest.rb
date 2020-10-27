class Quest < ApplicationRecord
  belongs_to :next_quest, :class_name => 'Quest', foreign_key: 'next_quest_id', required: false

  validates :title, :text, :code, presence: true
end
