date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id event.id
json.title event.title
json.start event.from_date.strftime(date_format) if event.from_date.present?
json.end event.to_date.strftime(date_format) if event.to_date.present?

json.color "#00c0ef"
json.allDay event.all_day_event? ? true : false

if policy(event).own_event?
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
else
  # json.show_url show_event_path(event)
end
json.event_name "event"
