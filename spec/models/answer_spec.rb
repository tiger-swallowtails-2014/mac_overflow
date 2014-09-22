require 'spec_helper'
describe Answer do
  context "associations" do
    it { should belong_to :user}
    it { should have_many :responses }
    it { should have_many :votes }
  end
end