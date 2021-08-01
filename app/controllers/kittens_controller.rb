class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
