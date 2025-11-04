# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:excavator).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:excavator) }
  end
end
