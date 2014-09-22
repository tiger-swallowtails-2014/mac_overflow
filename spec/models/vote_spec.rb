require 'spec_helper'
describe Vote do
  context "associations" do
    it { should belong_to :voteable}
    it { should respond_to(:voteable) }
  end
end