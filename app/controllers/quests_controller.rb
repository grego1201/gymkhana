class QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end

  def new
    @quests = Quest.all
    @quest = Quest.new
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])

    if @quest.update(quest_params)
      redirect_to quest_path(@quest, admin: true)
    else
      render 'edit'
    end
  end

  def create
    @quest = Quest.new(quest_params)

    if @quest.save
      redirect_to quest_path(@quest, admin: true)
    else
      render 'new'
    end
  end

  def show
    @admin_mode = params[:admin].to_s.downcase == 'true'
    @quest = Quest.find(params[:id])
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy

    redirect_to quests_path
  end

  def check_code
    @quest = Quest.find(params[:quest_id])
    code = params[:quest][:code]

    if @quest.code == code
      if @quest.next_quest_id
        redirect_to quest_path(@quest.next_quest_id)
      else
        redirect_to quests_path
      end
    else
      render 'show'
    end
  end

  private

  def quest_params
    permitted_params = params.require(:quest).permit(:title, :text, :code)
    next_quest_id = params[:quest][:next_quest_id]
    permitted_params[:next_quest] = Quest.find(next_quest_id) unless next_quest_id.empty?

    permitted_params
  end
end
