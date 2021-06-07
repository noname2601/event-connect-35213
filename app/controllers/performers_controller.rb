class PerformersController < ApplicationController
  def show
    
    @performer = Performer.find(params[:id])
    @introduction = Introduction.find(params[:id])
  end
end
