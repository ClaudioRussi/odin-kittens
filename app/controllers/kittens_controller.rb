class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten created"
      redirect_to @kitten
    else
      render 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def destroy
    flash[:notice] = "Kitten destroyed :("
    Kitten.find(params[:id]).destroy
    redirect_to :root
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    if Kitten.update(kitten_params)
      flash[:notice] = "Kitten updated"
      redirect_to kitten_path(params[:id])

    else
      render 'edit'
    end
  end

  private
  def kitten_params
    params.require(:kitten).permit([:name,:age,:cuteness,:softness])
  end
end
