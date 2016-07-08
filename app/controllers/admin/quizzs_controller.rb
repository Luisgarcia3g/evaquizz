class Admin::QuizzsController < ApplicationController
layout 'admin'
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

    @quizz= Quizz.find(params[:id])

    @quizz.update_attribute(:is_active, false
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
    @saludo = "Hola #{session[:nombre]}"
    @quizzes = Quizz.active.all.paginate(page: params[:page], per_page: 10).order('temaid ASC')
    @temas=Tema.all
  end

  def new
    checar
    @saludo = "Hola #{session[:nombre]}"
    @preguntas = Pregunta.all
    @path_prefix = :admin
    @quizz = Quizz.new
  end

  def show
    checar
      @saludo = "Hola #{session[:nombre]}"
    @quizz = Quizz.find(params[:id])
    @temas=Tema.all
  end

  def create
    checar
    @quizz = Quizz.new(quizz_params)
    if @quizz.save
        @tema=Tema.active.find_by(id: @quizz.temaid)
        @temario=Temario.active.find_by(id: @tema.temarioid)
        @grupos=Grupo.where(temarioid: @temario.id)


          @grupos.each do |g|
                @codigo= SecureRandom.hex(3)
            grupoquizz=Grupoquizzs.new(Grupo: g.id, Quizz: @quizz.id,Codigo: @codigo,  iniciado: false,  )
            grupoquizz.save


          end

      redirect_to :action => :show, :id => @quizz.id
    else
      render :new
    end
  end

  def edit
    checar
    @saludo = "Hola #{session[:nombre]}"
    @quizz = Quizz.find(params[:id])
    @tema_options = Tema.active.all.map{ |t| [ t.nombretema, t.id ] }
    @preguntas = Pregunta.active.all
  end

  def update
    checar
    @quizz = Quizz.find(params[:id])
    if @quizz.update_attributes(quizz_params)
      redirect_to :action => :show, :id =>@quizz.id
    else
      render :edit
    end
  end

  def pregunta_nueva
    checar
    @quizz = Quizz.find (params[:quizz_id])
    @preguntas = Pregunta.all
  end

  def agregar_pregunta
    checar
    pregunta = Pregunta.find(params[:pregunta_id])
    quizz = Quizz.find(params[:id] )
    pregunta_quizz = PreguntaQuizz.create(pregunta_id: pregunta.id, quizz_id: quizz.id)

    redirect_to admin_quizz_path(quizz.id)
  end

  private
  def quizz_params
    #Se manda el arreglo de los id de preguntas debo nombrarlo así
    #de lo contrario me da el error de Pregunta expected, got String
    params.require(:quizz).permit(:nombre, :disponible, :temaid)
  end


end
