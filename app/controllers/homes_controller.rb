class HomesController < ApplicationController
  def index
     @messages = Message.all.page(params[:page]).per(5)
  end
end
