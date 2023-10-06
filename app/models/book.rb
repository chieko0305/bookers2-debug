class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索方法分岐
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE?', '%' + content)
    elsif
      User.where('name LIKE?', '%' + content + '%')
    end
  end


  validates :title, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :body, presence: true, length: { maximum: 200 }
end
