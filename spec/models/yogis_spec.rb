require "rails_helper"

RSpec.describe Yogi, type: :model do
  describe 'relationship' do
    it { should belong_to :studio }
  end
end