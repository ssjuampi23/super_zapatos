class Article < ActiveRecord::Base
  attr_reader :store_name
  attr_accessible :description, :name, :price, :total_in_shelf, :total_in_vault, :store_id
  belongs_to :stores
  
  def store_name
    @store_name = Store.find(self.store_id).name
  end

end
