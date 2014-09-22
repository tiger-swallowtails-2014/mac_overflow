require 'spec_helper'
describe Response do
	context "associations" do
		it { should belong_to :answer }
		it { should belong_to :user }
	end
end