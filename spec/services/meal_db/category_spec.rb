require 'rails_helper'

describe MealDb::Category do

  context '#all' do
    let!(:expected_result) {[:@id_category, :@str_category, :@str_category_thumb, :@str_category_description]}
    it 'call category endpoint' do
      data = described_class.all
      expect(data.first.instance_variables).to eq(expected_result)
    end
  end
end
