class Post < ActiveRecord::Base
validates :content, presence: {message: "內容不能空白！"}
belongs_to :group, counter_cache: :posts_count
belongs_to :author, class_name: "User", foreign_key: :user_id

def editable_by?(user)
	user && user == author
end
scope :recent, ->{order("updated_at DESC")}
end
