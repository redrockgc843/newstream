class MembershipsController < ApplicationController
  def create
    artist_space = ArtistSpace.find(params[:artist_space_id])
    current_user.artist_spaces << artist_space

    redirect_to dashboard_path, notice: "Artist Space hinzugefügt."
  end

  def destroy
    membership = current_user.memberships.find_by!(
      artist_space_id: params[:artist_space_id]
    )

    membership.destroy!

    redirect_to dashboard_path, notice: "Artist Space entfernt."
  end
end
