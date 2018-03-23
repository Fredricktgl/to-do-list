class ListsController < ApplicationController

  def index
    @lists = List.all.limit(4).order(datetime: :DESC)
    @lists1 = List.all
  end

  def show;
    @lists = List.find(params[:id])
  end

  def new;
    @lists = List.new
  end

  def edit;
    @lists = List.find(params[:id])
  end

  def create;
    @lists = List.create(message_params)
    if @lists.save
        redirect_to root_path
    else
        render :new
    end
  end

  def update;
    @lists = List.find(params[:id])
    @lists.update(message_params)
    redirect_to root_path
  end

  def destroy;
    lists = List.find(params[:id])
    lists.destroy
    redirect_to root_path
  end

  def search
    @lists = List.where('message ILIKE ? OR location ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%").limit(4).offset(page_offset).order(datetime: :DESC)
    @lists1 = List.all
  end

  def page
    @lists = List.all.limit(4).offset(page_offset).order(datetime: :DESC)
    @lists1 = List.all
  end
  
  private

  def message_params
    params.require(:list).permit(:message, :location, :datetime, :status)
  end

  def page_offset
    page_offset = (params[:p].to_i - 1) * 4
  end

end