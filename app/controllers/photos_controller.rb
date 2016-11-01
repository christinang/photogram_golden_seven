class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({ :id => params[:id] })
    @photo_source = @photo.source
    @photo_caption = @photo.caption
    @photo_id = @photo.id
    end

  def new_form
  end

  def create_row
    photo = Photo.new
    photo.caption = params[:the_caption]
    photo.source = params[:the_source]
    photo.save
    redirect_to("/photos")
  end

def destroy
  @photo = Photo.find_by({ :id => params[:id] })
  @photo.destroy
  redirect_to("/photos")
end

def edit_form
  @photo = Photo.find_by({ :id => params[:id] })
end

def update_row
  photo = Photo.find_by({ :id => params[:id] })
  photo.caption = params[:updated_caption]
  photo.source = params[:updated_source]
  photo.save
  redirect_to("/photos/#{photo.id}")
end

end
