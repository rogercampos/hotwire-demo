class NotesController < ApplicationController
  def create
    @note = Note.new params[:note].permit!

    @result = @note.save
  end

  def destroy
    @note = Note.find params[:id]

    @note.destroy!
  end
end