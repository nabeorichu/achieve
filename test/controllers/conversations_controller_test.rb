require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  def index
    @users = U

  test "should get create" do
    get :create
    assert_response :success
  end

end
