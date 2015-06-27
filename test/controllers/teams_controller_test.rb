require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { channel_name: @team.channel_name, name: @team.name, user_id: @team.user_id }
    end

    assert_response 201
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should update team" do
    put :update, id: @team, team: { channel_name: @team.channel_name, name: @team.name, user_id: @team.user_id }
    assert_response 204
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_response 204
  end
end
