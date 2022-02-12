class ApplicationController < ActionController::Base
  def index
    @notes = Note.order(:id).pluck(:id)
    @note = Note.new
  end

  def css_demo
    index = params[:i].presence || 1
    render "css_demo_#{index}"
  end
end
