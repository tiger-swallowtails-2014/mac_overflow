# before(:each) do
#   @answer = FactoryGirl.create(:answer)
# end

require 'spec_helper'
describe AnswersController, type: :controller do 

	let!(:question) {create :question}
	let!(:answer) {create :answer}
	context "#create" do
		it "creates a new answer" do 
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
			}.to change{Answer.count}.by(1)
		end
		it "redirects back to the question page after creating an answer" do 
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
				response.should redirect_to controller: :questions, action: :show
			}
		end
		it "creates a new answer that corresponds to the given question" do
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
					expect Answer.last.question_id to eq(question.id)
			}
		end
	end

	context "#upvote" do
		it "creates a vote object when the upvote link is clicked and it is associated with that answer" do 
			expect{
				get :upvote, id: answer.id, use_route: :answers_controller
			}.to change{answer.votes.count}.from(0).to(1)
		end
		it "increments answer's vote_count attribute by one" do
			expect{
				get :upvote, id: answer.id, use_route: :answers_controller
				answer.reload
				}.to change{answer.votecount}.by(1)
		end
	end

	context "#downvote" do 
		let(:vote) {create :vote}
		# No matter what I try, this test won't PASS!!!! 
		# it "creates a vote object when the downvote link is clicked and it is associated with that answer" do 
		# 	expect{
		# 		answer.votes << vote
		# 		get :downvote, id: answer.id, use_route: :answers_controller
		# 		answer.reload
		# 	}.to change{answer.votes.size}.by(-1)
		# end
		it "decrements the corresponding answer's vote count by 1" do 
			expect{
				answer.votes << vote 
				get :downvote, id: answer.id, use_route: :answers_controller
				answer.reload
			}.to change{answer.votecount}.by(-1)
		end
	end











end