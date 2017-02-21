class GoalComment < ActiveRecord::Base

  validates :body, :poster, :goal, presence: true

  belongs_to :poster,
    class_name: :User,
    primary_key: :id,
    foreign_key: :poster_id

  belongs_to :goal

end
