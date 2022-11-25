require 'rails_helper'

describe MealDb::Recipe do

  context '#filter' do
    let!(:expected_result) {[:@str_meal, :@str_meal_thumb, :@id_meal]}
    it 'call recipe category endpoint' do
      data = described_class.filter('Seafood')
      expect(data.first.instance_variables).to eq(expected_result)
    end
  end
end
