# frozen_string_literal: true

require 'rails_helper'

module Api
  RSpec.describe TicketsController, type: :controller do
    let(:ticket) { create(:ticket) }

    describe 'GET #index' do
      subject(:get_index) { get :index, format: :json }

      before do
        get_index
        ticket
      end

      it 'gets all tickets' do
        expect(assigns(:tickets)).to eq([ticket])
      end
    end

    describe 'POST #create' do
      context 'when the request is valid' do
        subject(:valid_data) { JSON.parse(Rails.root.join('spec/fixtures/request_data.json').read) }

        before do
          post :create, body: valid_data.to_json, format: :json
        end

        it 'returns a success response' do
          expect(response).to have_http_status(:success)
        end
      end

      context 'when the request is invalid' do
        before do
          post :create, body: {}.to_json, format: :json
        end

        it 'returns unsuccessfully response' do
          expect(response.status).to eq(201)
        end
      end
    end
  end
end
