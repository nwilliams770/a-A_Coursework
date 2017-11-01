class Post < ApplicationRecord
  validates :title, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :comments,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment

    # this seems wrong?
  has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

end
