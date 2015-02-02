class Trap < ActiveRecord::Base
  has_many :requests, dependent: :destroy
end
