module UsersHelper
  def user_status(user)
    if user.confirmed?
      content_tag(:span, " ", class: "glyphicon glyphicon-ok color-success")
    else
      link_to "Confirm", user_active_url(token: user.confirmation_token), remote: true, data: { confirm: 'Are you sure?' }
    end
  end

  def authencity_types
    [['Super Admin','Super Admin'], ['Admin','Admin'], ['Teacher','Teacher'], ['Student','Student']]
  end
  def collect_all_course
    Course.all.map{|c| [c.name, c.id]} << ["All", "All"]
  end

  def get_lesson_activities_count(lesson)
    wa = lesson.writing_activities.count
    va = lesson.video_activities.count
    aa = lesson.audio_activities.count
    pa = lesson.presentation_activities.count
    ra = lesson.reading_activities.count
    qa = lesson.quiz_activities.count
    da = lesson.document_activities.count
    total = wa + va + aa + pa + ra + qa + da
  end

  def get_activities_count(course_id)
    return 0 if course_id.nil?
    wa = WritingActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    va = VideoActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    aa = AudioActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    pa = PresentationActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    ra = ReadingActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    qa = QuizActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    da = DocumentActivity.joins(:lesson).where("lessons.course_id = ?", course_id).count
    total = wa + va + aa + pa + ra + qa + da
  end

  def user_attened_activities(lesson)
    count = 0
    lesson.writing_activities.map{|wa| count += wa.student_answers.count}
    lesson.video_activities.map{|wa| count += wa.student_answers.count}
    lesson.audio_activities.map{|wa| count += wa.student_answers.count }
    lesson.quiz_activities.map{|wa| count += wa.student_answers.count }
    lesson.presentation_activities.map{|wa| count += wa.student_answers.count }
    count
  end

  def collect_student_answers(aq, u)
    aq.student_answers.map{|sa| sa if sa.user == u}.compact.first
    # aq.student_answers if (aq.student_answers.present?) && (aq.student_answers.user == u)
  end

  def get_lesson_activities(activity, user)
    stu_answers = activity.activity_questions.map {|aq| aq.student_answers}.flatten
    answers = stu_answers.map {|ans| ans if ans.user == user}.compact
    question_count = activity.activity_questions.count
    answers.count > 0 ? 1 : 0
  end

  def get_lesson_completed_activity(student, lesson)
    points =[]
    lesson.writing_activities.each { |e| points.push(get_lesson_activities(e, student)) }
    lesson.video_activities.each { |e| points.push(get_lesson_activities(e, student)) }
    lesson.audio_activities.each { |e| points.push(get_lesson_activities(e, student)) }
    lesson.quiz_activities.each { |e| points.push(get_lesson_activities(e, student)) }
    lesson.presentation_activities.each { |e| points.push(get_lesson_activities(e, student)) }
    points.compact.sum
  end

  def get_all_activity_progress(completed, total)
    if completed == 0 && total == 0
      return 0
    else
      return ((completed.to_f / total.to_f) * 100).to_f.round(2)
    end
  end

  def get_graded_points_count(activity, student)
    points =[]
    StudentGrade.where(user_id: student).where(activity_id: activity).each do |a|
      points.push(a.grade.to_f)
    end
    points.sum
  end

  def get_all_graded_points_count(lesson, student)
    points =[]
    lesson.writing_activities.each { |e| points.push(get_graded_points_count(e, student)) }
    lesson.video_activities.each { |e| points.push(get_graded_points_count(e, student)) }
    lesson.audio_activities.each { |e| points.push(get_graded_points_count(e, student)) }
    lesson.quiz_activities.each { |e| points.push(get_graded_points_count(e, student)) }
    lesson.presentation_activities.each { |e| points.push(get_graded_points_count(e, student)) }
    points.compact.sum
  end

  def get_lesson_points_count(lesson)
    points =[]
    lesson.writing_activities.each { |e| points.push(e.activity_points) }
    lesson.video_activities.each { |e| points.push(e.activity_points) }
    lesson.audio_activities.each { |e| points.push(e.activity_points) }
    lesson.quiz_activities.each { |e| points.push(e.activity_points) }
    lesson.presentation_activities.each { |e| points.push(e.activity_points) }
    points.compact.sum
  end

  def user_active_status(user)
    user.is_active ? "Active" : "Inactive"
  end
end
