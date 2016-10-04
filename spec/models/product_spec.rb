require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :supermarket }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:supermarket_id) }
  it { is_expected.to validate_uniqueness_of(:code).scoped_to(:supermarket_id) }
end
