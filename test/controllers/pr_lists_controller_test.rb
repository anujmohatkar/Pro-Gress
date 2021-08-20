require "test_helper"

class PrListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pr_list = pr_lists(:one)
  end

  test "should get index" do
    get pr_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_pr_list_url
    assert_response :success
  end

  test "should create pr_list" do
    assert_difference('PrList.count') do
      post pr_lists_url, params: { pr_list: { title: @pr_list.title } }
    end

    assert_redirected_to pr_list_url(PrList.last)
  end

  test "should show pr_list" do
    get pr_list_url(@pr_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_pr_list_url(@pr_list)
    assert_response :success
  end

  test "should update pr_list" do
    patch pr_list_url(@pr_list), params: { pr_list: { title: @pr_list.title } }
    assert_redirected_to pr_list_url(@pr_list)
  end

  test "should destroy pr_list" do
    assert_difference('PrList.count', -1) do
      delete pr_list_url(@pr_list)
    end

    assert_redirected_to pr_lists_url
  end
end
