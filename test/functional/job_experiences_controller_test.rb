require 'test_helper'

class JobExperiencesControllerTest < ActionController::TestCase
  setup do
    @job_experience = job_experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_experience" do
    assert_difference('JobExperience.count') do
      post :create, job_experience: { company: @job_experience.company, description: @job_experience.description, job_title: @job_experience.job_title, start_date: @job_experience.start_date }
    end

    assert_redirected_to job_experience_path(assigns(:job_experience))
  end

  test "should show job_experience" do
    get :show, id: @job_experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_experience
    assert_response :success
  end

  test "should update job_experience" do
    put :update, id: @job_experience, job_experience: { company: @job_experience.company, description: @job_experience.description, job_title: @job_experience.job_title, start_date: @job_experience.start_date }
    assert_redirected_to job_experience_path(assigns(:job_experience))
  end

  test "should destroy job_experience" do
    assert_difference('JobExperience.count', -1) do
      delete :destroy, id: @job_experience
    end

    assert_redirected_to job_experiences_path
  end
end
