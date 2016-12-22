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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end


  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(params[:artist])
    @song.artist = @artist
    @song.save
    if !params[:genre][:name] == ""
      @genre = Genre.find_or_create_by(params[:genre])
      @song.genres << @genre
    end
    # flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
  

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @artist = Artist.find_or_create_by(params[:artist])
    @song.artist = @artist
    @song.save
    if !params[:genre][:name] == ""
      @genre = Genre.find_or_create_by(params[:genre])
      @song.genres << @genre
    end
    redirect to "/songs/#{@song.slug}"
  end



end