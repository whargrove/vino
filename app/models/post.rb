class Post < ActiveRecord::Base
  include Comparable
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :user_id
  validates :link_url, presence: { if: :link }
  validates :published_at, presence: { if: Proc.new { |post| post.scheduled? || post.published? } }
  validate :link_url_format_valid?, if: :link

  # will_paginate number of posts per page
  self.per_page = 5

  enum status: { draft: 0, scheduled: 1, published: 2 }

  def should_generate_new_friendly_id?
    title_changed?
  end

  def tweet
    status = "New post: \"#{self.title}\" weshargrove.com/posts/#{self.friendly_id}"
    twitter_client.update(status)
  end

  private

  def link_url_format_valid?
    uri = URI.parse(link_url)
    if !uri.kind_of?(URI::HTTP)
      errors.add(:link_url, "must be a valid format")
    end
  rescue URI::InvalidURIError
    errors.add(:link_url, "must be a valid format")
    false
  end

  def twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
  end
end
