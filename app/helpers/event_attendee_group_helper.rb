module EventAttendeeGroupHelper
  def is_active(is_active)
    is_active.present? && is_active ? "Yes" : "No" 
  end

  def enrolled_course_users
    [["All", "all"], ["All Students", "students"], ["All Teachers", "teachers"], ["All Courses", "courses"]]
  end
end
