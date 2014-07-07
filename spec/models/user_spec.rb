require 'spec_helper'

describe User do
	context '#validations' do
		it { should validate_uniqueness_of :username }
		it { should validate_presence_of :username }
		it { should validate_presence_of :password_hash }
		it { should ensure_length_of(:password_hash).is_at_least(8)
                                         .with_message(/Password must be at least 8 characters long./) }
    it { should allow_value('Ex123#45').for(:password_hash) }
    it { should validate_uniqueness_of :user_email }
    it { should validate_presence_of :user_email }
    it { should allow_value('example@gmail.com').for(:username) }
    it { should allow_value(55555).for(:user_zipcode) }
	end
end
