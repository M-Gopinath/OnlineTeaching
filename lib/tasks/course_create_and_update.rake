namespace :course_create_and_update do

  desc "Course create or update process"
  task :course_mail => :environment do
    p '-------------------------------------------------------'
    p "rake job for course create or update process"
    p ENV['DOMAIN']
    p ENV['COURSEID']
    Apartment::Tenant.switch("#{ENV['DOMAIN'].to_s}") do
      p @course = Course.find_by(id: ENV['COURSEID'].to_i)
      p UserMailer.create_course(@course).deliver if @course.present?
    end
  end

end