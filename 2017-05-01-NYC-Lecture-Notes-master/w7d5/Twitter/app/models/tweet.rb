class Tweet < ActiveRecord::Base
  validates_presence_of :tweeter_id, :body
  belongs_to :tweeter, class_name: "User"
end
