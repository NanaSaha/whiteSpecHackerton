require 'rails_helper'
require 'spec_helper'



RSpec.describe User, type: :model do

  context 'validation test' do

      it 'ensures username presence' do
      user = User.new( email: 'sample@example.com').save
      expect(user).to eq(false)
    end

      it 'ensures email presence' do
      user = User.new( username: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures username and email is presence' do
      user = User.new(username: "jjd", email: 'sample@example.com').save
      expect(user).to eq(true)
    end
end
end
