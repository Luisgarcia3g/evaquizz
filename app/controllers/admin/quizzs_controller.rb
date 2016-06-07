class Admin::QuizzsController < ApplicationController

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

  def logout

  session[:tokenusuario]=nil
  session[:rol]=nil

      redirect_to '/welcome'
  end

  def index
    checar
    @quizzes = Quizz.all.paginate(page: params[:page], per_page: 10).order('temaid ASC')
    @temas=Tema.all
  end

  def new
    checar
    @tema_options = Tema.all.map{ |t| [ t.nombretema, t.id ] }
    @preguntas = Pregunta.all
    @path_prefix = :admin
    @quizz = Quizz.new
  end

  def show
    checar
    @quizz = Quizz.find(params[:id])
    @temas=Tema.all
  end

  def create
    checar
    @quizz = Quizz.new(quizz_params)
    if @quizz.save
      redirect_to :action => :show, :id => @quizz.id
    else
      render :new
    end
  end

  def edit
    checar
    @quizz = Quizz.find(params[:id])
    @tema_options = Tema.all.map{ |t| [ t.nombretema, t.id ] }
    @preguntas = Pregunta.all
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
    @quizz = Quizz.find { params[:quizz_id]  }
    @preguntas = Pregunta.all
  end

  def agregar_pregunta
    checar
    pregunta = Pregunta.find(params[:pregunta_id])
    quizz = Quizz.find { params[:quizz_id]  }
    pregunta_quizz = PreguntaQuizz.create(pregunta_id: pregunta.id, quizz_id: quizz.id)
    flash[:notice] = "Pregunta agregada"
    redirect_to admin_quizz_path(quizz.id)
  end

private
  def quizz_params
    #Se manda el arreglo de los id de preguntas debo nombrarlo así
    #de lo contrario me da el error de Pregunta expected, got String
   params.require(:quizz).permit(:nombre, :disponible, :temaid)
  end


end
