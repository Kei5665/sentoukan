class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :quests, dependent: :destroy

  enum role: {
    general: 0,
    admin: 1,
  }

<<<<<<< HEAD
  def recieve_money
=======
  def earn_rewards
>>>>>>> a3254c7b79e4a5c6b964ea0c318da7259824961e
    compensation_amount = 800
    self.earned_money += compensation_amount
    self.save!
  end
end
