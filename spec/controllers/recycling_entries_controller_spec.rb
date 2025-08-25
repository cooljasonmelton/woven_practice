require 'rails_helper'

RSpec.describe RecyclingEntriesController, type: :controller do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com') }


  it "creates a recycling entry" do
    post :create, params: { recycling_entry: { user_id: user.id, material: "Glass", weight: 1.1 } }
    expect(response).to have_http_status(:created)
  end

  it "fails to create recycling entry with invalid weight" do
    post :create, params: {
      recycling_entry: {
        user_id: user.id,
        material: "Glass",
        weight: 0
      }
    }
    expect(response).to have_http_status(:unprocessable_entity)
  end
  # describe 'GET #show' do
  #   let(:user) { User.create!(name: 'Test User', email: 'test@example.com') }

  #   it 'returns a successful response' do
  #     get :show, params: { id: user.id }
  #     expect(response).to be_successful
  #   end

  #   it 'returns user with recycling entries' do
  #     get :show, params: { id: user.id }
  #     json_response = JSON.parse(response.body)
  #     expect(json_response['id']).to eq(user.id)
  #   end

  #   it 'returns 404 for non-existent user' do
  #     expect {
  #       get :show, params: { id: 999 }
  #     }.to raise_error(ActiveRecord::RecordNotFound)
  #   end
  # end
end
