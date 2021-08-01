class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
