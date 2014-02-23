class SitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    image_params = params.require(:image).permit(:url, :photo, :text)
    @image = Image.new(image_params)

    redirect_to root_path
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
