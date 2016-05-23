class Admin::QuizzsController < ApplicationController

  def index
    @quizzes = Quizz.all
  end

def new
    @preguntas = Pregunta.all.paginate(page: params[:page], per_page: 2)
  @path_prefix = :admin
  @quizz = Quizz.new
end

def show

    @quizz = Quizz.find(params[:id])
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

end

private
  def quizz_params
    params.require(:quizz).permit(:nombre, :disponible)
  end



end
