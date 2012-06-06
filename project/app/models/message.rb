class Message < ActiveRecord::Base
  attr_accessible :channel, :content, :from
end
