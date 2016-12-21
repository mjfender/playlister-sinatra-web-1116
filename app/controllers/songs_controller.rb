class SongsController < ApplicationController 

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all 
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(params[:artist])
    @song.artist = @artist
    @song.save
    if !params[:genre].nil?
      @genre = Genre.find_or_create_by(params[:genre])
      @song.genres << @genre
    end
    redirect to "/songs/#{@song.slug}"
  end



end