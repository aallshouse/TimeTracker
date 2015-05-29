require 'test_helper'

class WorkItemTypesControllerTest < ActionController::TestCase
  setup do
    @work_item_type = work_item_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_item_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_item_type" do
    assert_difference('WorkItemType.count') do
      post :create, work_item_type: { description: @work_item_type.description }
    end

    assert_redirected_to work_item_type_path(assigns(:work_item_type))
  end

  test "should show work_item_type" do
    get :show, id: @work_item_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_item_type
    assert_response :success
  end

  test "should update work_item_type" do
    patch :update, id: @work_item_type, work_item_type: { description: @work_item_type.description }
    assert_redirected_to work_item_type_path(assigns(:work_item_type))
  end

  test "should destroy work_item_type" do
    assert_difference('WorkItemType.count', -1) do
      delete :destroy, id: @work_item_type
    end

    assert_redirected_to work_item_types_path
  end
end
