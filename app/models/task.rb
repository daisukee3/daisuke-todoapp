# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :date
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
class Task < ApplicationRecord
    has_one_attached :eyecatch
    
    validates :title, presence: true
    validates :content, presence: true

    has_many :comments, dependent: destroy
    belongs_to :user
end
