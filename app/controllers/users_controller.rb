class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'sub_domain'
  def index
    all_users
  end

  def search_users
    @role = params[:role]
    if params[:user_name_email].present?
      if @role.present?
        @users = User.get_user(params[:user_name_email], @role).paginate(page: params[:page], per_page: 4)
      else
        @users = User.search_by_name_email(params[:user_name_email])
      end
    elsif !@role.present?
      @users = User.all.paginate(page: params[:page], per_page: 4)
    else
      @users = User.get_user_with_role(@role).paginate(page: params[:page], per_page: 4)
    end
  end

  def update_role
    if params[:role][:name].present?
      user = User.find_by(id: params[:user_id])
      user.update_user_role(params[:role][:name])
    end
  end

  def new_user
    @user = User.new(user_params)
    pwd = SecureRandom.hex(4)
    @user.password = pwd
    @user.password_confirmation = pwd
    @user.subdomain = current_user.subdomain
    if @user.save
      @error = ""
      all_users
      UserMailer.welcome_email(@user,pwd).deliver
    else
      @error = @user.errors.full_messages.join(',')
    end
  end

  def user_active
    @user = User.find_by(confirmation_token: params[:token])
    @user.confirm if @user.present?
    all_users
  end

  def user_search
    @admins = User.admin.where("email LIKE ?", "%#{params[:search]}%")
    @teachers = User.teacher.where("email LIKE ?", "%#{params[:search]}%")
    @students = User.student.where("email LIKE ?", "%#{params[:search]}%")
  end

  def export_users
    @users = User.export_user(params[:type])
    respond_to do |format|
      format.xlsx{ response.headers['Content-Disposition'] = "attachment; filename=Users(#{params[:type]}).xlsx"}
    end
  end

  def import_users
    @import = User.import_users(params[:file])
  end

  def sort_users
    @admins = User.admin.paginate(page: params[:admin], per_page: params[:list])
    @teachers = User.teacher.paginate(page: params[:teacher], per_page: params[:list])
    @students = User.student.paginate(page: params[:student], per_page: params[:list])
  end

  def active_deactive_users
    @user = User.find(params[:user_id])
    @user.toggle(:is_active)
    @user.save
    all_users
  end


  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role_id)
  end

  def all_users
    @admins = User.admin.paginate(page: params[:admin], per_page: 10)
    @teachers = User.teacher.paginate(page: params[:teacher], per_page: 10)
    @students = User.student.paginate(page: params[:student], per_page: 10)
  end
end
