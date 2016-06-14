class Admin::PreguntasController < ApplicationController
  layout "preguntas"
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

  def desactivar

    @temario = Temario.find(params[:id])

    @temario.update_attribute(:is_active, false
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
    @saludo = "Hola  #{$usuarioNombre}"
    @preguntas = Pregunta.all.paginate(page: params[:page], per_page: 10).order('texto ASC')
  end

  def new
      @saludo = "Hola administrador #{$usuarioNombre}"
    checar
    @path_prefix = :admin
    @pregunta = Pregunta.new
  end

  def show
    checar
      @saludo = "Hola administrador #{$usuarioNombre}"
    @pregunta = Pregunta.find(params[:id])
  end

  def create
    checar
      @saludo = "Hola administrador #{$usuarioNombre}"
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
      @saludo = "Hola administrador #{$usuarioNombre}"
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
    params.require(:pregunta).permit(:image, :texto,  :respuesta1,:respuesta2, :respuesta3, :respuesta4, :tiempo)
  end


end
