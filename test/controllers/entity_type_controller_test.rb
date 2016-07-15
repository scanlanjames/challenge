require 'test_helper'

class EntityTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get entity_id" do
    get entity_type_entity_id_url
    assert_response :success
  end

end
