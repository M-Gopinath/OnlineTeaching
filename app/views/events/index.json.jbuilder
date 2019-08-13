json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.title event.title
  json.start event.from_date.strftime(date_format) if event.from_date.present?
  json.end event.to_date.strftime(date_format) if event.to_date.present?
  json.color "#346cb0"
  json.allDay event.all_day_event? ? true : false
  if policy(event).own_event? 
    json.update_url event_path(event, method: :patch)
    json.edit_url edit_event_path(event)
  else
    # json.show_url show_event_path(event)
  end
  json.event_name "event"
end


json.array! @courses do |course|
  date_format = course.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id course.id
  json.title course.name
  json.start course.start_date.strftime(date_format) if course.start_date.present?
  json.end course.end_date.strftime(date_format) if course.end_date.present?
  json.color "#00a65a"
  json.allDay course.all_day_event? ? true : false
  json.show_url event_course_path(course)
  json.event_name "course"
end

json.array! @lessons do |lesson|
  date_format = lesson.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id lesson.id
  json.name lesson.name
  json.start lesson.start_date.strftime(date_format) if lesson.start_date.present?
  json.end lesson.end_date.strftime(date_format) if lesson.end_date.present?
  json.color "#dd4b39"
  json.allDay lesson.all_day_event? ? true : false
  json.show_url event_lesson_path(lesson)
  json.event_name "lesson"
end


json.array! @video_activities do |video|
  date_format = video.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id video.id
  json.title video.name
  json.start video.due_date.strftime(date_format) if video.due_date.present?
  json.color "#00c0ef"
  json.allDay video.all_day_event? ? true : false
  json.show_url video_activity_path(video)
  json.event_name "video"
end


json.array! @writing_activies do |writing|
  date_format = writing.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id writing.id
  json.title writing.name
  json.start writing.due_date.strftime(date_format) if writing.due_date.present?
  json.color "#00c0ef"
  json.allDay writing.all_day_event? ? true : false
  json.show_url writing_activity_path(writing)
  json.event_name "writing"
end

json.array! @audio_activities do |audio|
  date_format = audio.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id audio.id
  json.title audio.name
  json.start audio.due_date.strftime(date_format) if audio.due_date.present?
  json.color "#00c0ef"
  json.allDay audio.all_day_event? ? true : false
  json.show_url audio_activity_path(audio)
  json.event_name "audio"
end


json.array! @quiz_activities do |quiz|
  date_format = quiz.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id quiz.id
  json.title quiz.name
  json.start quiz.due_date.strftime(date_format) if quiz.due_date.present?
  json.color "#00c0ef"
  json.allDay quiz.all_day_event? ? true : false
  json.show_url quiz_activity_path(quiz)
  json.event_name "Quiz"
end
