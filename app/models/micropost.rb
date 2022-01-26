class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  scope :newest, ->{order created_at: :desc}
  scope :by_user_ids, ->(user){where user_id: user.following_ids << user.id}
  validates :content, presence: true, length: {maximum: Settings.post_length}
  validates :image, content_type: {in: Settings.img_type,
                                   message: I18n.t("img_valid")},
                    size: {less_than: Settings.img_data_size.megabytes,
                           message: I18n.t("img_size")}
  def display_image
    image.variant resize_to_limit: Settings.img_size
  end
end
