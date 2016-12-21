class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include Sluggifiable::InstanceMethods
  extend Sluggifiable::ClassMethods

end
