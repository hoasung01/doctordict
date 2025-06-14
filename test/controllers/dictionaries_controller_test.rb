require "test_helper"

class DictionariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dictionaries_index_url
    assert_response :success
  end

  test "should get show" do
    get dictionaries_show_url
    assert_response :success
  end

  test "should get search" do
    get dictionaries_search_url
    assert_response :success
  end

  test "should get import" do
    get dictionaries_import_url
    assert_response :success
  end
end
