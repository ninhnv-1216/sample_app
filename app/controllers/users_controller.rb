class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)
  before_action :load_user, except: %i(index new create)
  before_action :admin_user, only: %i(destroy)

  def index
    @pagy, @users = pagy User.activate, items: Settings.items_page
  end

  def new
    @user = User.new
  end

  def show
    @pagy, @microposts = pagy @user.microposts.newest,
                              items: Settings.items_page
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "please_check"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "updated"
      redirect_to @user
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = t "user_delete_failed"
    end
    redirect_to users_url
  end

  def following
    @title = t "following"
    @pagy, @users = pagy @user.following, items: Settings.items_page
    render "show_follow"
  end

  def followers
    @title = t "followers"
    @pagy, @users = pagy @user.followers, items: Settings.items_page
    render "show_follow"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "please_login"
    redirect_to login_path
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "error.not_found"
    redirect_to root_url
  end
end
