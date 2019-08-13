# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_07_120005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_answers", force: :cascade do |t|
    t.string "name"
    t.integer "activity_question_id"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_messages", force: :cascade do |t|
    t.text "body"
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "activity_room_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_questions", force: :cascade do |t|
    t.string "field_type"
    t.string "name"
    t.integer "activity_id"
    t.string "activity_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "activity_rooms", force: :cascade do |t|
    t.string "title"
    t.integer "lesson_id"
    t.string "activity_type"
    t.integer "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.text "message"
    t.boolean "archive", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.bigint "user_id"
    t.boolean "important", default: false
    t.string "title"
    t.boolean "is_public"
    t.string "to_whom"
    t.index ["course_id"], name: "index_announcements_on_course_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "audio_activities", force: :cascade do |t|
    t.string "name"
    t.string "audio_file"
    t.string "embedded_audio"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_audio_activities_on_lesson_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "chat_room_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_read", default: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_subscriptions", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "plan_id"
    t.date "subscription_start_date"
    t.date "subscription_end_date"
    t.string "discount_id"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_subscriptions_on_client_id"
    t.index ["plan_id"], name: "index_client_subscriptions_on_plan_id"
  end

  create_table "client_templates", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.boolean "is_active", default: true
    t.boolean "is_paid", default: false
    t.boolean "is_free", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id"
  end

  create_table "client_types", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.boolean "is_active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subdomain"
    t.string "orgination_name"
    t.boolean "is_confirmed", default: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_template_id"
    t.bigint "client_type_id"
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
  end

  create_table "course_attachments", force: :cascade do |t|
    t.string "attachment"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_attachments_on_course_id"
  end

  create_table "course_chat_attachments", force: :cascade do |t|
    t.string "image"
    t.integer "enroll_course_message_id"
    t.string "audio"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_chat_likes", force: :cascade do |t|
    t.integer "enroll_course_message_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_images", force: :cascade do |t|
    t.string "image"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_images_on_course_id"
  end

  create_table "course_ratings", force: :cascade do |t|
    t.bigint "course_id"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["course_id"], name: "index_course_ratings_on_course_id"
    t.index ["user_id"], name: "index_course_ratings_on_user_id"
  end

  create_table "course_users", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_videos", force: :cascade do |t|
    t.string "video"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_videos_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "creator_id"
    t.boolean "is_required", default: false
    t.boolean "is_publish", default: false
    t.boolean "is_complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.text "objectives"
    t.integer "clone_count", default: 0
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "plan_id"
    t.float "discount_cost"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_discounts_on_plan_id"
  end

  create_table "discussion_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_discussion_activities_on_lesson_id"
  end

  create_table "document_activities", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "file_url"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.text "description"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_document_activities_on_lesson_id"
  end

  create_table "enroll_course_messages", force: :cascade do |t|
    t.text "body"
    t.integer "course_id"
    t.integer "user_id"
    t.integer "enroll_course_room_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_read", default: false
  end

  create_table "enroll_course_rooms", force: :cascade do |t|
    t.string "title"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "essay_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "activity_points"
    t.date "due_date"
    t.boolean "required"
    t.boolean "publish"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_essay_activities_on_lesson_id"
  end

  create_table "event_attendee_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "user_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "from_date"
    t.datetime "to_date"
    t.boolean "is_active"
    t.boolean "is_public"
    t.string "created_by"
    t.bigint "event_attendee_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "to_whom"
    t.string "color"
    t.integer "course_id"
    t.bigint "user_id"
    t.index ["event_attendee_group_id"], name: "index_events_on_event_attendee_group_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "lesson_attachments", force: :cascade do |t|
    t.string "attachment"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_attachments_on_lesson_id"
  end

  create_table "lesson_images", force: :cascade do |t|
    t.string "image"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_images_on_lesson_id"
  end

  create_table "lesson_messages", force: :cascade do |t|
    t.text "body"
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_videos", force: :cascade do |t|
    t.string "video"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_videos_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id"
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "creator_id"
    t.boolean "is_required", default: false
    t.boolean "is_publish", default: false
    t.boolean "is_complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "live_conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_live_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_live_conversations_on_sender_id"
  end

  create_table "live_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "live_conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_read", default: false
    t.index ["live_conversation_id"], name: "index_live_messages_on_live_conversation_id"
    t.index ["user_id"], name: "index_live_messages_on_user_id"
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "notification_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.string "notificable_type"
    t.integer "notificable_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_informations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "landing_page_image"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "activity_points"
    t.date "due_date"
    t.boolean "required"
    t.boolean "publish"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_page_activities_on_lesson_id"
  end

  create_table "plan_benefits", force: :cascade do |t|
    t.bigint "plan_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_plan_benefits_on_plan_id"
  end

  create_table "plan_subscriptions", force: :cascade do |t|
    t.integer "plan_id"
    t.datetime "subscribed_at"
    t.datetime "expiry_at"
    t.bigint "user_id"
    t.boolean "is_active", default: true
    t.text "stripe_customer_id"
    t.string "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plan_subscriptions_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.float "duration"
    t.string "cost"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "stripe_id"
    t.string "duration_type"
    t.float "storage_limit"
  end

  create_table "post_images", force: :cascade do |t|
    t.string "image"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audio"
    t.string "video"
    t.index ["post_id"], name: "index_post_images_on_post_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["user_id"], name: "index_post_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "presentation_activities", force: :cascade do |t|
    t.string "name"
    t.string "slide_file"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.text "description"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_presentation_activities_on_lesson_id"
  end

  create_table "quiz_activities", force: :cascade do |t|
    t.string "name"
    t.bigint "lesson_id"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_quiz_activities_on_lesson_id"
  end

  create_table "reading_activities", force: :cascade do |t|
    t.string "name"
    t.string "documents"
    t.text "assignment"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_setup_tooltips", force: :cascade do |t|
    t.boolean "name", default: false
    t.boolean "description", default: false
    t.boolean "landing_page_image", default: false
    t.boolean "logo", default: false
    t.boolean "fc_teacher_selection", default: false
    t.boolean "fc_course_title", default: false
    t.boolean "fc_subtitle", default: false
    t.boolean "fc_course_start_date", default: false
    t.boolean "fc_course_end_date", default: false
    t.boolean "fc_course_description", default: false
    t.boolean "fc_course_objectives", default: false
    t.boolean "fc_course_attachment", default: false
    t.boolean "fc_course_image", default: false
    t.boolean "fc_course_video", default: false
    t.boolean "fc_lesson_title", default: false
    t.boolean "fc_lesson_description", default: false
    t.boolean "fc_lesson_start_date", default: false
    t.boolean "fc_lesson_end_date", default: false
    t.boolean "fc_activity", default: false
    t.boolean "template_selection", default: false
    t.boolean "choose_plan", default: false
    t.boolean "payment_done", default: false
    t.boolean "launch", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_answers", force: :cascade do |t|
    t.string "name"
    t.integer "activity_question_id"
    t.integer "user_id"
    t.integer "activity_answer_id"
    t.string "activity_answer_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "student_grades", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.string "activity_type"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_answer_id"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notification_id"
    t.date "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "client_type_id"
    t.string "orgination_name"
    t.string "subdomain"
    t.integer "role_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "customer_id"
    t.string "bio"
    t.string "avatar"
    t.string "facebook_url"
    t.string "linkedin_url"
    t.string "twitter_url"
    t.string "instagram_url"
    t.string "stripe_customer_id"
    t.boolean "is_active", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_activities", force: :cascade do |t|
    t.string "name"
    t.string "video"
    t.string "embedded_video"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.bigint "lesson_id"
    t.integer "activity_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_video_activities_on_lesson_id"
  end

  create_table "writing_activities", force: :cascade do |t|
    t.string "name"
    t.string "question"
    t.date "due_date"
    t.boolean "publish"
    t.boolean "required"
    t.integer "activity_points"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["lesson_id"], name: "index_writing_activities_on_lesson_id"
  end

  add_foreign_key "announcements", "courses"
  add_foreign_key "announcements", "users"
  add_foreign_key "audio_activities", "lessons"
  add_foreign_key "client_subscriptions", "clients"
  add_foreign_key "client_subscriptions", "plans"
  add_foreign_key "clients", "client_types"
  add_foreign_key "course_attachments", "courses"
  add_foreign_key "course_images", "courses"
  add_foreign_key "course_ratings", "courses"
  add_foreign_key "course_ratings", "users"
  add_foreign_key "course_videos", "courses"
  add_foreign_key "discounts", "plans"
  add_foreign_key "discussion_activities", "lessons"
  add_foreign_key "document_activities", "lessons"
  add_foreign_key "essay_activities", "lessons"
  add_foreign_key "events", "event_attendee_groups"
  add_foreign_key "events", "users"
  add_foreign_key "lesson_attachments", "lessons"
  add_foreign_key "lesson_images", "lessons"
  add_foreign_key "lesson_videos", "lessons"
  add_foreign_key "lessons", "courses"
  add_foreign_key "live_messages", "live_conversations"
  add_foreign_key "live_messages", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "page_activities", "lessons"
  add_foreign_key "plan_benefits", "plans"
  add_foreign_key "plan_subscriptions", "users"
  add_foreign_key "post_images", "posts"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "post_likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "presentation_activities", "lessons"
  add_foreign_key "quiz_activities", "lessons"
  add_foreign_key "video_activities", "lessons"
  add_foreign_key "writing_activities", "lessons"
end
