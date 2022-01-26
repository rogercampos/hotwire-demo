class ApplicationController < ActionController::Base
  def index
    @notes = Note.order(:id).all
    @note = Note.new
  end
end
