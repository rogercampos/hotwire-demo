class ApplicationController < ActionController::Base
  def index
    @notes = Note.all
    @note = Note.new
  end
end
