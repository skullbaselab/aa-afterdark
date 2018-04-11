require 'rspec'
require 'rails_helper'

require_relative '../query_lib/03a_nobel_bonus.rb'

describe 'nobel bonus problems' do
  describe 'physics_no_chemistry' do
    it 'shows years in which physics prizes (but not chemistry) were awarded' do
      expect(physics_no_chemistry.conform).to contain_exactly(
        ["1933"],
        ["1924"],
        ["1919"],
        ["1917"]
      )
    end
  end
end
