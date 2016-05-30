class Admin::QuizzsController < ApplicationController

  def index
    @quizzes = Quizz.all
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

private
  def quizz_params
   params.require(:quizz).permit(:nombre, :disponible, :temaid)
  end



end
