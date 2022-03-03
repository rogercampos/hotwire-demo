class UsersController < ApplicationController
  def create
    @user_form = UserForm.new(params[:user_form].permit!)

    if @user_form.save
      redirect_to new_user_path, notice: "Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find params[:id]

    UserForm.new(emails: ["one", "two"])
    UserForm.new(emails: params[:user][:emails])

    if @user.update(params[:user])
      redirect_to new_user_path, notice: "Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user_form = UserForm.new
    @user_form.setup_from({zip: "08005", country: "spain"})
  end
end
