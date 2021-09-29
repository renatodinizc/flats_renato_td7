require 'rails_helper'

describe PropertyType do
  context 'validatons' do
    it 'name must be present' do
      property_type = PropertyType.new

      property_type.valid?

      expect(property_type.errors.full_messages_for(:name)).to include('Tipo não pode ficar em branco')
    end
  end
end
