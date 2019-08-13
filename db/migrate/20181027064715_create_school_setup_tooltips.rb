class CreateSchoolSetupTooltips < ActiveRecord::Migration[5.2]
  def change
    create_table :school_setup_tooltips do |t|
      t.boolean :name, default: false
      t.boolean :description, default: false
      t.boolean :landing_page_image, default: false
      t.boolean :logo, default: false
      t.boolean :fc_teacher_selection, default: false
      t.boolean :fc_course_title, default: false
      t.boolean :fc_subtitle, default: false
      t.boolean :fc_course_start_date, default: false
      t.boolean :fc_course_end_date, default: false
      t.boolean :fc_course_description, default: false
      t.boolean :fc_course_objectives, default: false
      t.boolean :fc_course_attachment, default: false
      t.boolean :fc_course_image, default: false
      t.boolean :fc_course_video, default: false
      t.boolean :fc_lesson_title, default: false
      t.boolean :fc_lesson_description, default: false
      t.boolean :fc_lesson_start_date, default: false
      t.boolean :fc_lesson_end_date, default: false
      t.boolean :fc_activity, default: false
      t.boolean :template_selection, default: false
      t.boolean :choose_plan, default: false
      t.boolean :payment_done, default: false
      t.boolean :launch, default: false

      t.timestamps
    end
  end
end
