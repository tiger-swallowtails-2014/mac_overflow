require 'spec_helper'
describe ResponsesController, :type => :controller do

	context "#new" do
		let(:answer) { create :answer }
		it "should generate and recognize the #new route" do
			get :new, answer_id: answer.id, use_route: :responses_controller
			expect(response).to be_ok
		end

		it "assigns @answer to the current answer in route" do
			get :new, answer_id: answer.id, use_route: :responses_controller
			expect(assigns(:answer)).to eq(Answer.find(answer.id))
		end
	end

	context "#create" do
		let(:answer) { create :answer }
		it "creates a new response" do
			expect {
				post :create, answer_id: answer.id, :response => attributes_for(:response), use_route: :responses_controller
			}.to change{ Response.count }.by(1)
		end

		it "creates a new response for a particular answer" do
			expect {
				post :create, answer_id: answer.id, :response => attributes_for(:response), use_route: :responses_controller
			}.to change{(Answer.find(answer.id).responses.count) }.by(1)
		end

		it "assigns @answer to the current answer in route" do
			get :new, answer_id: answer.id, use_route: :responses_controller
			expect(assigns(:answer)).to eq(Answer.find(answer.id))
		end
	end
end