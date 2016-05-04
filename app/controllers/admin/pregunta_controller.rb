class Admin::PreguntaController < ApplicationController

  def nueva

  end

  def create
    @pregunta = Pregunta.new(pregunta_params)

     @pregunta.save
  redirect_to :action => :show, :id => @pregunta.id
   end

   private
     def pregunta_params
       params.require(:pregunta).permit(:texto,:respuesta1,:respuesta2, :respuesta3, :respuesta4, :tiempo)
     end

     def show
       @pregunta = Pregunta.find(params[:id])
     end
end
