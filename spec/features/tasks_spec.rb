require 'spec_helper'
require 'capybara/rspec'

describe "Tasks" do
  @task = Task.create :task => 'go to bed'
  describe "GET /tasks" do
    it "display some tasks" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit tasks_path
      #get tasks_index_path
      #response.status.should be(200)
      page.should have_content 'go to bed'
    end
    
    it "creates a new task" do
      visit tasks_path
      fill_in 'Task', :with => 'go to work'
      click_button 'Create Task'

      current_path.should == tasks_path
      page.should have_content 'go to work'

      save_and_open_page

    end

    it "should not update empty task" do
      visit tasks_path
      click_link 'Edit'
      
      fill_in 'Task', :with => ''
      click_button 'Update Task'

      #current_path.should == edit_task_path(@task)
      page.should have_content 'There was an error updating your task.'

    end
  end

  describe "DELETE /tasks" do
    it "should delete a task" do
      visit tasks_path
      find('#task#{@task.id}').click_link "Delete"
      page.should have_content 'Task has been deleted'
      page.should have_no_content
    end
  end
end
