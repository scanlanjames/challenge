require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get index" do
    get tags_url, as: :json
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
#	entity_tags=@tag.entity_tags
#	entity_tags=[entity_tags] #if !entity_tags.nil? && entity_tags.is_a?(String)
      post "/tag", params: { tag: { entity_id: @tag.entity_id, entity_tags: [@tag.entity_tags], entity_type: @tag.entity_type } }, as: :json
    end

    assert_response 201
  end

  test "should show tag" do
    get "/tags/#{@tag.id}", as: :json
    assert_response :success
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete "/tags/#{@tag.id}", as: :json
    end

    assert_response 204
  end
end
