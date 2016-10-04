require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  it { is_expected.to have_many :products }
  it { is_expected.to validate_uniqueness_of :name }
end
