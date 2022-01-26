class ApplicationController < ActionController::Base
  def index
    @notes = Note.order(:id).pluck(:id)
    @note = Note.new
  end
end
