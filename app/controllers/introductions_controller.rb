class IntroductionsController < ApplicationController
  before_action :set_introduction, except: [:index, :new, :create, :search]
  before_action :authenticate_performer!, except: [:index, :show, :search]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @introductions = Introduction.includes(:performer).order("created_at DESC")
  end
  
  def new
    @introduction = Introduction.new
  end

  def create
    @introduction = Introduction.new(introduction_params)
    if @introduction.valid?
       @introduction.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @introduction.messages
    
    
  end

  def edit
  end

  def update
    if @introduction.update(introduction_params)
      redirect_to introduction_path(@introduction)
    else
      render :edit
    end
  end

  def destroy
    if @introduction.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @introductions = Introduction.search(params[:search])
  end
  


  private

  def introduction_params
    params.require(:introduction).permit(:skill, :description, :twitter_id, :image).merge(performer_id: current_performer.id)
  end 

  def set_introduction
    @introduction = Introduction.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_performer == @introduction.performer
  end
end
