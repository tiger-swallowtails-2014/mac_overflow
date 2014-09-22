require 'spec_helper'
describe UsersController, :type => :controller do

	let!(:user) {create :user}

	context "#show" do 
		it "should find the correct user with a successful response" do 
			get :show, id: user.id
			expect(response).to be_success
		end
	end

	context "#create" do 
		it "should create a new user" do 
			expect{
				post :create, user: attributes_for(:user)
			}.to change{User.count}.by(1)
		end
		it "should set a session for the user" do 
			expect {
				post :create, user: attributes_for(:user)
				session[:user_id].to eq(user.id)
			}
		end
		it "should redirect to the main questions page" do 
			expect {
				post :create, user: attributes_for(:user)
				should redirect_to controller: :questions, action: :index
			}
		end

	end

end