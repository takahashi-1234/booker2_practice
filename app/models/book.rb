class Book < ApplicationRecord
  has_many:favorites ,dependent: :destroy
  belongs_to:user
  has_many:comments ,dependent: :destroy
  validates:title,presence:true
  validates:body,presence:true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end