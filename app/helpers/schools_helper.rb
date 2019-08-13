module SchoolsHelper

  def client_template_color(temp_id)
    client = current_account
    if client.client_template_id == temp_id
      "template-highlight"
    end
  end

  def plan_selected(plan_id)
    client_plan = current_account.client_subscriptions.last
    if client_plan.present? && client_plan.plan_id == plan_id
      "plan-selected"
    end
  end

  def client_template_present
    client = Client.find_by(subdomain: request.subdomain)
    client.client_template_id.present?
  end


  def course_next_id
    Course.count > 0 ? Course.maximum(:id)+1 : 1
  end
  

  def show_video_activity(type)
    case type
    when 'video'
      video = VideoActivity.all.count
      quiz = QuizActivity.all.count
      video > quiz ? "hide" : "show"
    when "quiz"
      quiz = QuizActivity.all.count
      reading = ReadingActivity.all.count
      reading > quiz ? "hide" : "show"
    end
  end

  def answer_counts(activity)
    answers = []
    activity.activity_questions.includes(:student_answers).each do |question|
      question.student_answers.each do |answer|
        grade_activity = StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: answer.user.id, student_answer_id: answer.id)
        answers << answer if grade_activity.nil?
      end
    end
    answers.count.to_i
  end


  def activity_icon(a)
    case a.class.name
    when "VideoActivity"
      "/assets/video.png"
    when "AudioActivity"
      "/assets/audio.png"
    when "PresentationActivity"
      "/assets/presentation.png"
    when "DocumentActivity"
      "/assets/document.png"
    when "QuizActivity"
      "/assets/quiz.png"
    when "PageActivity"
      "/assets/page.png"
    when "DiscussionActivity"
      "/assets/discussion.png"
    else
      "https://img.icons8.com/ios-glyphs/20/878787/question-mark.png"
    end
  end

 def activity_icon(activity)
    case activity.class.name
    when "VideoActivity"
      "/assets/video.png"
    when "AudioActivity"
      "/assets/audio.png"
    when "PresentationActivity"
      "/assets/presentation.png"
    when "DocumentActivity"
      "/assets/document.png"
    when "QuizActivity"
      "/assets/quiz.png"
    when "PageActivity"
      "/assets/page.png"
    when "DiscussionActivity"
      "/assets/discussion.png"
    else
      "https://img.icons8.com/ios-glyphs/20/878787/question-mark.png"
    end
  end

end
