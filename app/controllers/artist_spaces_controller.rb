class ArtistSpacesController < ApplicationController
  def index
    @artist_spaces = ArtistSpace.all
  end

  def new
    @artist_space = ArtistSpace.new
  end

  def create
    @artist_space = ArtistSpace.new(artist_space_params)
    if @artist_space.save
      redirect_to artist_spaces_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @artist_space = ArtistSpace.find(params[:id])
  end

  def edit
    @artist_space = ArtistSpace.find(params[:id])
  end

  def update
    @artist_space = ArtistSpace.find(params[:id])

    if @artist_space.update(artist_space_params)
      redirect_to artist_space_path(@artist_space),
                  notice: "Artist Space wurde erfolgreich aktualisiert."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artist_space = ArtistSpace.find(params[:id])
    @artist_space.destroy
    redirect_to artist_spaces_path, notice: "Artist Space wurde gelöscht."
  end

  private

  def artist_space_params
    params.require(:artist_space).permit(:artist_name, :bio, :social_media_url, :website_url)
  end
end
