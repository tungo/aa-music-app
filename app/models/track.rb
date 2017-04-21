# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  song       :string           not null
#  album_id   :integer          not null
#  kind       :string           not null
#  lyric      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  KINDS = %w(bonus regular)

  validates :song, :album_id, :kind, presence: true
  validates :kind, inclusion: KINDS

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
end
