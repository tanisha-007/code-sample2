require 'rails_helper'
describe RecipesController, type: :controller do

  context 'recipe controller methods describe' do
    let!(:index_expected_keys) {["str_meal", "str_meal_thumb", "id_meal"]}
    let!(:show_expected_keys) {["id_meal", "str_meal", "str_drink_alternate", "str_category", "str_area", "str_instructions", "str_meal_thumb", "str_tags", "str_youtube", "str_ingredient1", "str_ingredient2", "str_ingredient3", "str_ingredient4", "str_ingredient5", "str_ingredient6", "str_ingredient7", "str_ingredient8", "str_ingredient9", "str_ingredient10", "str_ingredient11", "str_ingredient12", "str_ingredient13", "str_ingredient14", "str_ingredient15", "str_ingredient16", "str_ingredient17", "str_ingredient18", "str_ingredient19", "str_ingredient20", "str_measure1", "str_measure2", "str_measure3", "str_measure4", "str_measure5", "str_measure6", "str_measure7", "str_measure8", "str_measure9", "str_measure10", "str_measure11", "str_measure12", "str_measure13", "str_measure14", "str_measure15", "str_measure16", "str_measure17", "str_measure18", "str_measure19", "str_measure20", "str_source", "str_image_source", "str_creative_commons_confirmed", "date_modified"]}

    describe 'Index' do
      it 'should return recipes of category' do
        get :index, params: {category: 'Seafood'}
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).first.keys).to eq (index_expected_keys)
      end
    end

    describe 'Show' do
      it 'should return recipe' do
        get :show, params: {id: 52918}
        expect(response.status).to eq 200
        response_body = JSON.parse(response.body)
        expect(response_body.count).to eq 1
        expect(response_body.first.keys).to eq (show_expected_keys)
      end

      it 'should return null when no recipe found' do
        get :show, params: {id: 918}
        expect(response.status).to eq 200
        expect(response.body).to eq 'null'
      end
    end
  end
end
