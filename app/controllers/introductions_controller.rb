class IntroductionsController < ApplicationController
  before_action :set_introduction, except: [:index, :new, :create, :genre]
  before_action :search_genre_introduction, only: [:index, :genre, :show]
  before_action :authenticate_performer!, except: [:index, :show, :genre]
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

  def genre
    @introduction = @q.result
    genre_id = params[:q][:genre_id_eq]
    @genre = Genre.find_by(id: genre_id)
  end

  
  private

  def introduction_params
    params.require(:introduction).permit(:genre_id, :description, :twitter_id, :image).merge(performer_id: current_performer.id)
  end 

  def set_introduction
    @introduction = Introduction.find(params[:id])
  end

  def search_genre_introduction
    @q = Introduction.ransack(params[:q])
  end

  def contributor_confirmation
    redirect_to root_path unless current_performer == @introduction.performer
  end
end
