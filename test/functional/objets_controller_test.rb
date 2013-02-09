require 'test_helper'

class ObjetsControllerTest < ActionController::TestCase
  setup do
    @objet = objets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objet" do
    assert_difference('Objet.count') do
      post :create, objet: {  }
    end

    assert_redirected_to objet_path(assigns(:objet))
  end

  test "should show objet" do
    get :show, id: @objet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objet
    assert_response :success
  end

  test "should update objet" do
    put :update, id: @objet, objet: {  }
    assert_redirected_to objet_path(assigns(:objet))
  end

  test "should destroy objet" do
    assert_difference('Objet.count', -1) do
      delete :destroy, id: @objet
    end

    assert_redirected_to objets_path
  end
end
