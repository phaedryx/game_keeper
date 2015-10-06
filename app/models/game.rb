class Game < ActiveRecord::Base
  validates :name, presence: { message: 'Game name is required.' }
end
