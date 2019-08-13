class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user, optional: true
  belongs_to :parent,  class_name: "Post", optional: true
  has_many   :replies, class_name: "Post", foreign_key: :parent_id, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_one :post_notification, as: :notificable, class_name: "Notification"
  accepts_nested_attributes_for :post_images

  def created_date
    created_at? ? DateTimeAssist.convert_into_current_zone(created_at) : "-"
  end

  def user_like_status(user)
    user_like(user) ? "Unlike" : "Like"
  end

  def user_like(user)
    post_likes.where("user_id = ?", user.id).any?
  end

  def self.today_posts
    Post.where("created_at >= ? and created_at <= ?",Time.now.beginning_of_day,Time.now.end_of_day)
  end

  def self.current_week_posts
    Post.where("created_at >= ? and created_at <= ?",Time.now.beginning_of_week,Time.now.end_of_week)
  end

  def self.current_month_posts
    Post.where("created_at >= ? and created_at <= ?",Time.now.beginning_of_month,Time.now.end_of_month)
  end
end
