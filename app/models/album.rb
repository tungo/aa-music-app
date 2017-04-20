# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  CATEGORIES = %w(live studio)

  validates :title, :band_id, :category, presence: true
  validates :category, inclusion: CATEGORIES

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks, dependent: :destroy,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track

end
