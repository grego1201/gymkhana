class AddEndQuestTextToQuests < ActiveRecord::Migration[6.0]
  def change
    add_column :quests, :end_quest_text, :string
  end
end
