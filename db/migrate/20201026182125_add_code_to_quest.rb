class AddCodeToQuest < ActiveRecord::Migration[6.0]
  def change
    add_column :quests, :code, :string
  end
end
