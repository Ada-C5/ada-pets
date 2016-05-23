require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "requires a name" do
    generic_pet = Pet.new
    refute generic_pet.valid?
    assert_includes :name, p.errors.keys
  end

  test "requires a pet's name to be unique per human" do
    # hint: Read about uniqueness 'scope'
    # http://guides.rubyonrails.org/active_record_validations.html#uniqueness
    assert pets(:rosa).valid?

    also_rosa = pets(:rosa).dup
    refute also_rosa.valid?
    assert_includes :name, p.errors.keys
  end
end
