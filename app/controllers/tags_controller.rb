class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def require_login
    unless current_user
      redirect_to root_path
      flash.notice = "You can't do that!"
      return false
    end
  end

  def index
    @tag = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end
end
