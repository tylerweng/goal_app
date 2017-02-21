class UserComment < ActiveRecord::Base

  validates :body, :poster, :postee, presence: true

  belongs_to :poster,
    class_name: :User,
    primary_key: :id,
    foreign_key: :poster_id

  belongs_to :postee,
    class_name: :User,
    primary_key: :id,
    foreign_key: :postee_id
end
