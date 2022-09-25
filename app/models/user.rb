class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :quests, dependent: :destroy

  enum role: {
    general: 0,
    admin: 1,
  }

  def earn_rewards
    compensation_amount = 800
    self.earned_money += compensation_amount
    self.save!
  end
end
