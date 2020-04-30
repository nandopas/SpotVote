class AlbumsController < ApplicationController
	require 'rspotify'

	RSpotify.authenticate(ENV['SPOTIFY_KEY'], ENV['SPOTIFY_SECRET'])

	def index
		#load 100 albums, order by votes
		@albums = Album.limit(100).order(votes: :desc)
	end

	def search
		#display alert if query is empty
		if params[:album].blank?  
    		redirect_to(root_path, alert: "No input!")  
  		else 
  			#save parameter as instance variable so i dont have to keep typing params[:album]
			@parameter = params[:album]
			#search spotifies Album API
			@albums = RSpotify::Album.search(@parameter)
			#need to add some caching here to reduce searches and attempts to make database entries
			#for every result add to db. db will ignore if the album exists
			@albums.each do |album|
				Album.create(name: album.name, artist: album.artists.first.name, image: album.images.first['url'], votes: 0)
			end
			#reset the albums variable to search the db with fresh queries
			@albums = nil
			#applies a case insensitive search on both artist and album name
			@albums = Album.where("lower(artist) LIKE lower(?)", "%" + @parameter + "%").or(Album.where("lower(name) LIKE lower(?)", "%" + @parameter + "%"))

		end
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def vote
		#get album by id
		@album = Album.find(params[:id])
		#increment votes
		@album.increment!(:votes)
		#redirect
		redirect_back(fallback_location: root_path)
	end

	private
		#not using this anymore, but ill keep it handy
		private
		  def album_params
		    params.require(:album).permit(:name, :artist, :image, :votes)
		  end
end
