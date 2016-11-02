# == Schema Information
#
# Table name: congressmen
#
#  id                :integer          not null, primary key
#  name              :string
#  congressperson_id :string
#  state             :string
#  party             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Congressman < ApplicationRecord
  has_many :expenses
end
