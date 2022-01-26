class NotesController < ApplicationController
  def create
    @note = Note.new params[:note].permit!

    @result = @note.save
  end

  def destroy
    @note = Note.find params[:id]

    @note.destroy!
  end

  def edit
    @note = Note.find params[:id]
  end

  def update
    @note = Note.find params[:id]

    if @note.update(params[:note].permit!)
      render :show
    else
      render :edit
    end
  end

  def show
    @note = Note.find params[:id]
  end
end