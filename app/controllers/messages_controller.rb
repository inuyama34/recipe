class MessagesController < ApplicationController
  def index
    @messages = Message.all.page(params[:page]).per(5)
  end

  def show
    @message= Message.find(params[:id])
  end

  def new
    @message=Message.new
  end

  def create
    @message=Message.new(message_params)
    if @message.save
      flash[:success]= "recipeの投稿しました"
      redirect_to @message 
    else
      flash.now[:danger] = "reicpeが投稿できませんでした"
      render :new
    end
  end

  def edit
    @message= Message.find(params[:id])
  end

  def update
    @message=Message.find(params[:id])
    if @message.update(message_params)
     flash[:success]= "recipeの投稿しました"
      redirect_to @message 
    else
      flash.now[:danger] = "reicpeが投稿できませんでした"
      render :new
    end
  end

  def destroy
    @message=Message.find(params[:id])
    @message.destroy
    
    flash[:success] = 'recipe は正常に削除されました'
    redirect_to messages_url
  end
  
  
   private

  # Strong Parameter
  def message_params
    params.require(:message).permit(:content,:recipe,:image)
  end
end
