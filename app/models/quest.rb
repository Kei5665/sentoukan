class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  enum role: {
    in_progress: 0,
    finished: 1,
  }
end
