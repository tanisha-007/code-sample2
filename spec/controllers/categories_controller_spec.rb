require 'rails_helper'

describe CategoriesController, type: :controller do

  describe 'Index' do
    let!(:expected_response_keys) {["id_category", "str_category", "str_category_thumb", "str_category_description"]}

    it 'should return categories' do
      get :index
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).last.keys).to eq(expected_response_keys)
    end
  end
end

