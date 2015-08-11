class Post < ActiveRecord::Base
  validates :title, :presence => true, :length => { :minimum => 5 }, :exclusion => { :in => ["Title"] }
  has_many :comments
end
