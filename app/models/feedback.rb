class Feedback < ActiveRecord::Base
  #belongs_to :reviewer, class_name: 'User'
  #belongs_to :client, class_name: 'User'
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id,  presence: true
  validates :resume, presence: true
  #validates :reviewer_id


  #validates :appearance, length: { maximum: 300 }
  #validates :experience, length: { maximum: 300 }
  #validates :organization, length: { maximum: 300 }
  #validates :overall, length: { maximum: 300 }
  #validates :score, :numericality => { only_integer: true,	
  #									   :greater_than_or_equal_to => 0, 
 # 									   :less_than_or_equal_to => 100}
end
