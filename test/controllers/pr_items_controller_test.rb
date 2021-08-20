require 'test_helper'

class PrItemsControllerTest < ActionController::TestCase
  setup do
    @pr_list = pr_lists(:one)
    @pr_item = pr_items(:one)
  end

  test "should get index" do
    get :index, params: { pr_list_id: @pr_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { pr_list_id: @pr_list }
    assert_response :success
  end

  test "should create pr_item" do
    assert_difference('PrItem.count') do
      post :create, params: { pr_list_id: @pr_list, pr_item: @pr_item.attributes }
    end

    assert_redirected_to pr_list_pr_item_path(@pr_list, PrItem.last)
  end

  test "should show pr_item" do
    get :show, params: { pr_list_id: @pr_list, id: @pr_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { pr_list_id: @pr_list, id: @pr_item }
    assert_response :success
  end

  test "should update pr_item" do
    put :update, params: { pr_list_id: @pr_list, id: @pr_item, pr_item: @pr_item.attributes }
    assert_redirected_to pr_list_pr_item_path(@pr_list, PrItem.last)
  end

  test "should destroy pr_item" do
    assert_difference('PrItem.count', -1) do
      delete :destroy, params: { pr_list_id: @pr_list, id: @pr_item }
    end

    assert_redirected_to pr_list_pr_items_path(@pr_list)
  end
end
