class ImagesController < ApplicationController
  def index
  end

  def new
    @image = Image.new
  end

  def create
    image_params = params.require(:image).permit(:url, :photo, :text)
    @image = Image.create(image_params)

    redirect_to @image
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
