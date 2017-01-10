class Post < ActiveRecord::Base
  #this validates presence of title, and makes sure that the length is not more than 140 words
  validates :title, presence:true, length: {maximum: 140}
  # this validates presence of body
  validates :body, presence:true
end
