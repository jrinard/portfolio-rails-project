require 'rails_helper'

# unit testing spec
describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
