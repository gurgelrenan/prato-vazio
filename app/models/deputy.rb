# == Schema Information
#
# Table name: deputies
#
#  id                  :integer          not null, primary key
#  congressperson_id   :string
#  congressperson_name :string
#  state               :string
#  party               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Deputy < ApplicationRecord
  has_many :expenses

  def max_expense
    expenses.order("net_value DESC").first
  end
end
