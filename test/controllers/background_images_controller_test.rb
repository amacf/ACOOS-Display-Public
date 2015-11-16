require 'test_helper'

class BackgroundImagesControllerTest < ActionController::TestCase
  setup do
    @background_image = background_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:background_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create background_image" do
    assert_difference('BackgroundImage.count') do
      post :create, background_image: { image: @background_image.image }
    end

    assert_redirected_to background_image_path(assigns(:background_image))
  end

  test "should show background_image" do
    get :show, id: @background_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @background_image
    assert_response :success
  end

  test "should update background_image" do
    patch :update, id: @background_image, background_image: { image: @background_image.image }
    assert_redirected_to background_image_path(assigns(:background_image))
  end

  test "should destroy background_image" do
    assert_difference('BackgroundImage.count', -1) do
      delete :destroy, id: @background_image
    end

    assert_redirected_to background_images_path
  end
end
