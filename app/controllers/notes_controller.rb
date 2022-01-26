class NotesController < ApplicationController
  def create
    @note = Note.new params[:note].permit!

    if @note.save
      redirect_to root_path
    else
      @notes = Note.all
      render :index, status: :unprocessable_entity
    end
  end
end