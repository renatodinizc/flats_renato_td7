require 'rails_helper'

describe PropertyRegion do
  context 'validations' do
    it 'name must be present' do
      region = PropertyRegion.new

      region.valid?

      expect(region.errors.full_messages_for(:name)).to include('Região não pode ficar em branco')
    end
  end
end

