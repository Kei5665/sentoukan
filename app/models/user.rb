class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :quests, dependent: :destroy

  enum role: {
    general: 0,
    admin: 1
  }
end
