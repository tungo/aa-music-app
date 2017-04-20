# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, dependent: :destroy,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Album

end
