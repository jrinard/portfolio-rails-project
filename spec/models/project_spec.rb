require 'rails_helper'

# unit testing spec
describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
end
