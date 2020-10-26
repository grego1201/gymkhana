class AddNextQuestToQuests < ActiveRecord::Migration[6.0]
  def change
    add_column :quests, :next_quest_id, :integer
  end
end
