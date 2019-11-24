class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(name: params[:pet][:name])
    if params[:pet][:owner_id]
      @pet.owner_id=params[:pet][:owner_id].first
    elsif params[:owner_name]
      owner = Owner.create(name: params[:owner_name])
      @pet.owner = owner
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do 
    if @pet = Pet.find_by(id: params[:id])
      @owners = Owner.all
      erb :'pets/edit'
    else
      redirect '/pets'
    end
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    @pet.update(owner: @owner) if ((@owner = Owner.new(params[:owner])) && @owner.save)
    redirect "/pets/#{@pet.id}"
  end
end