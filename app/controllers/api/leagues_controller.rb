class Api::LeaguesController < ApplicationController
  def index
    # render json: League.all
    render json: League.get_data
  end
end
