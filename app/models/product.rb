class Product < ApplicationRecord
  belongs_to :supermarket

  validates :name, :code, uniqueness: { scope: :supermarket_id }
end
