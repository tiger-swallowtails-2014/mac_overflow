require 'spec_helper'
describe QuestionsController, :type => :controller do

	context "#index" do
		let!(:question) { create :question }
		let(:user) { create :user }
		it "should return a 200 status code" do
			get :index
			expect(response.status).to be(200)
		end


		it "assigns @questions the set of ordered questions" do
			get :index
			expect(assigns(:questions)).to eq Question.order(votecount: :desc)
		end
	end

	context "#create" do
		let(:user) { create :user }
		it "generates and recognizes the create route" do
			assert_routing({ path: 'questions', method: :post }, { controller: 'questions', action: 'create' })
		end


		it "should create a new question" do
			expect {
				controller.session[:user_id] = user.id
				post :create, :question => attributes_for(:question)
			}.to change{ Question.count }.by(1)
		end

		it "should create a question that is the current user's" do
			expect {
			controller.session[:user_id] = user.id
			post :create, :question => attributes_for(:question)
			}.to change{(User.find(user.id).questions.count) }.by(1)
		end
	end

	context "#show" do
		it "should return a 200 status code" do
			question_path, id="1"
			expect(response.status).to be(200)
		end
	end
end