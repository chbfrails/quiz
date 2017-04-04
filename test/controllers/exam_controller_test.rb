require 'test_helper'

class ExamControllerTest < ActionDispatch::IntegrationTest
  test "should get index,enroll" do
    get exam_index,enroll_url
    assert_response :success
  end

end
