# frozen_string_literal: true

require "rails_helper"

def tasks_url
  Rails.application.routes.url_helpers.tasks_url(only_path: true)
end

RSpec.describe TasksController, type: :request do
  let(:task) { create(:task, name: name, description: description) }
  let(:name) { "Task foo" }
  let(:description) { "Description of #{name}" }
  let(:user) { create(:user) }

  it_behaves_like "authentication is required", tasks_url

  context "when user is authenticated" do
    login_user

    describe "GET /index" do
      it_behaves_like "success response", tasks_url
    end

    describe "GET /show" do
      it "shows a task" do
        get task_url(task)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_task_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "shows a edit form" do
        get edit_task_url(task)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      it "creates a new task" do
        post tasks_url, params: { task: { name: name, description: description } }
        expect(response).to redirect_to(task_url(Task.last))
      end
    end

    describe "DELETE /task" do
      it "destroys the task" do
        task_to_delete = Task.create!(name: name, description: description, user: user)
        expect do
          delete task_url(task_to_delete)
        end.to change(Task, :count).by(-1)
      end
    end

    describe "PATCH /task" do
      let(:new_description) { "new #{description}" }

      before do
        patch task_url(task), params: { task: { description: new_description } }
        task.reload
      end

      it "updates description" do
        expect(task.description).to eq new_description
      end

      it "redirect to /task/id" do
        expect(response).to redirect_to(task_url(task))
      end
    end
  end
end
