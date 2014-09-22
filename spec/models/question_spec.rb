require 'spec_helper'
describe Question do
  context "associations" do
    it { should belong_to :user}
    it { should have_many :answers}
    it { should have_many :votes }
  end
end