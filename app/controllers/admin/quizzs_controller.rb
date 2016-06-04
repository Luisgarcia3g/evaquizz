class Admin::QuizzsController < ApplicationController

  def index
    @quizzes = Quizz.all.paginate(page: params[:page], per_page: 10).order('temaid ASC')
    @temas=Tema.all
  end

  def new
    @tema_options = Tema.all.map{ |t| [ t.nombretema, t.id ] }
    @preguntas = Pregunta.all
    @path_prefix = :admin
    @quizz = Quizz.new
  end

  def show
    @quizz = Quizz.find(params[:id])
    @temas=Tema.all
  end

  def create
    @quizz = Quizz.new(quizz_params)
    if @quizz.save
      redirect_to :action => :show, :id => @quizz.id
    else
      render :new
    end
  end

  def edit
    @quizz = Quizz.find(params[:id])
    @tema_options = Tema.all.map{ |t| [ t.nombretema, t.id ] }
    @preguntas = Pregunta.all
  end

  def update
    @quizz = Quizz.find(params[:id])
    if @quizz.update_attributes(quizz_params)
      redirect_to :action => :show, :id =>@quizz.id
    else
      render :edit
    end
  end

private
  def quizz_params
    #Se manda el arreglo de los id de preguntas debo nombrarlo así
    #de lo contrario me da el error de Pregunta expected, got String
   params.require(:quizz).permit(:nombre, :disponible, :temaid, :preguntas_ids => [])
  end


end
