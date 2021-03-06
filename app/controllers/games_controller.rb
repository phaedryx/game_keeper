class GamesController < ApplicationController
  before_filter :find_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.order(:name)
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to :games, notice: 'Game created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update_attributes(game_params)
      redirect_to :games, notice: 'Game updated'
    else
      render :edit
    end
  end

  def destroy
    if @game.destroy
      redirect_to :games, notice: 'Game destroyed'
    else
      redirect_to @game, notice: 'Game couldn\'t be destroyed'
    end
  end

  protected

  def game_params
    params.require(:game).permit(:name)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
