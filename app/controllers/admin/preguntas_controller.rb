class Admin::PreguntasController < ApplicationController
  layout "admin"
  def checar
    if (session[:tokenusuario]==nil)


      redirect_to '/welcome'
    else

      if(session[:rol]==1)

        redirect_to :maestro

      elsif (session[:rol]==2)
        redirect_to :alumno




      end

    end


  end
def filtrar

end
  def desactivar

    @pregunta = Pregunta.find(params[:id])

    @pregunta.update_attribute(:is_active, false
    )
    redirect_to :back

  end
  def logout

    session[:tokenusuario]=nil
    session[:rol]=nil

    redirect_to '/welcome'
  end
  def index

    checar
    @saludo = "Hola  #{session[:nombre]}"
    @preguntas = Pregunta.active.all.paginate(page: params[:page], per_page: 10).order('texto ASC')
  end

  def new
      @saludo = "Hola administrador #{$usuarioNombre}"
    checar
    @path_prefix = :admin
    @pregunta = Pregunta.new
  end

  def show
    checar
      @saludo = "Hola #{session[:nombre]}"
    @pregunta = Pregunta.find(params[:id])
    @tema=Tema.active.find_by(id: @pregunta.temaid)
  end

  def create
    checar
      @saludo = "Hola #{session[:nombre]}"
    @pregunta = Pregunta.new(pregunta_params)
    if @pregunta.save
      redirect_to :action => :show, :id => @pregunta.id
    else
      render :new
    end
    #@pregunta = Pregunta.new(pregunta_params)
  end

  def edit
    checar
      @saludo = "Hola #{session[:nombre]}"
    # @path_prefix = :admin
    @pregunta = Pregunta.find(params[:id])


  end
  def update
    checar
    @pregunta = Pregunta.find(params[:id])

    if @pregunta.update_attributes(pregunta_params)
      redirect_to :action => :show, :id =>@pregunta.id
    else
      render :edit
    end
  end

  private
  def pregunta_params
    checar
    params.require(:pregunta).permit(:image, :texto, :temaid,  :respuesta1,:respuesta2, :respuesta3, :respuesta4, :tiempo)
  end


end
