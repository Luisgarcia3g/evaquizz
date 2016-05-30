class Admin::TemariosController < ApplicationController




  def index
    @temario = Temario.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @path_prefix = :admin
    @temario = Temario.new
  end

  def show
    @path_prefix = :admin
    @temario = Temario.find(params[:id])
@temas=Tema.where(temarioid: @temario.id ).paginate(page: params[:page], per_page: 10)
  end

  def create
    @temario = Temario.new(temario_params)
    if @temario.save
      redirect_to :action => :show, :id => @temario.id
    else
      render :new
    end

  end

  def edit
    # @path_prefix = :admin
    @temario = Temario.find(params[:id])
  end

   private
     def temario_params
       params.require(:temario).permit(:nombretemario, :descripcion)
     end


end
