class AlbumsController <  ApplicationController

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new
    if @album.save
      redirect_to band_album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
