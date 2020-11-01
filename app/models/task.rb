# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text
#  deadline   :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
end
