class Admin::TemasController < ApplicationController
  def index
    @tema = Tema.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @path_prefix = :admin
    @tema = Tema.new
  end

  def show
    @path_prefix = :admin
    @tema = Tema.find(params[:id])
  end

  def create
    @tema = Tema.new(tema_params)
    if @tema.save
      redirect_to :action => :show, :id => @tema.id
    else
      render :new
    end

  end

  def edit
    # @path_prefix = :admin
    @tema = Tema.find(params[:id])
  end

   private
     def tema_params
       params.require(:tema).permit(:nombretema, :descripcion)
     end

end
