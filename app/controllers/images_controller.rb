class ImagesController < ApplicationController
  require 'aws/s3'

  def index
  end

  def new
    @image = Image.new
  end

  def create
    image_params = params.require(:image).permit(:url, :photo, :text, :photolink)
    @image = Image.create(image_params)
    AWS.config({
                 :access_key_id     =>  'AKIAI6AECUXY23A6B56Q',
                 :secret_access_key => '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'
    })

    s3 = AWS::S3.new
    bucket_name = "goodevil"
    file_name = "public/#{@image.photo.url}"
    key = File.basename("public/#{@image.photo.url}")
    bucket = s3.buckets[bucket_name]
    s3.buckets["goodevil"].objects[key].write(:file => file_name)
    @image.update_attributes(aws_url: "https://s3.amazonaws.com/goodevil/"+"#{@image.photo.filename}")
    File.delete("#{Rails.root}/public/#{@image.photo.url}")


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
