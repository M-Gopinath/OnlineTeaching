class CommonTask
  def self.load_default_data
    p "role section"

    roles = Role::ROLES
    roles.each do |role|
      Role.find_or_create_by(name: role)
    end

    SchoolSetupTooltip.create(name: false, description: false, landing_page_image: false, logo: false, fc_teacher_selection: false, fc_course_title: false, fc_subtitle: false, fc_course_start_date: false, fc_course_end_date: false, fc_course_description: false, fc_course_objectives: false, fc_course_attachment: false, fc_course_image: false, fc_course_video: false, fc_lesson_title: false, fc_lesson_description: false, fc_lesson_start_date: false, fc_lesson_end_date: false, fc_activity: false, template_selection: false, choose_plan: false, payment_done: false, launch: false)
  end
end
