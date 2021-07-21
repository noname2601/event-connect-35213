class LikesController < ApplicationController
  before_action :find_introduction

  def create
    like = current_performer.likes.build(introduction_id: params[:introduction_id])
    like.save
  end

  def destroy
    like = Like.find_by(introduction_id: params[:introduction_id], performer_id: current_performer.id)
    like.destroy
  end

  private

  def find_introduction
    @introduction = Introduction.find_by(id: params[:introduction_id])
  end
end
