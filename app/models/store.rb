class Store < ActiveRecord::Base
  attr_accessible :address, :name, :store_id
  has_many :articles, dependent: :destroy
end
