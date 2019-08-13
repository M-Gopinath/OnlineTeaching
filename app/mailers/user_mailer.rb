class UserMailer < ApplicationMailer
	def welcome_email(user,password)
		@user = user
		@pwd = password
		mail(to: @user.email, subject: 'Welcome to our site')
	end

  def create_course(course)
    @course = course
    @users = User.except_admins
    @users.each do |user|
      @user = user
      mail(to: user.email, subject: "New Course Created")
    end
  end

  def update_course(course)
    @course = course
    @users = @course.users
    @users.each do |user|
      @user = user
      mail(to: user.email, subject: "Course Updated")
    end
  end

end
