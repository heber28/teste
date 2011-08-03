class LivrosController < ApplicationController
  def index
    @livros = Livro.all
  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new
  end

  def create
    @livro = Livro.new(params[:livro])
    if @livro.save
      redirect_to @livro, :notice => "Successfully created livro."
    else
      render :action => 'new'
    end
  end

  def edit
    @livro = Livro.find(params[:id])
  end

  def update
    @livro = Livro.find(params[:id])
    if @livro.update_attributes(params[:livro])
      redirect_to @livro, :notice  => "Successfully updated livro."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy
    redirect_to livros_url, :notice => "Successfully destroyed livro."
  end
end
