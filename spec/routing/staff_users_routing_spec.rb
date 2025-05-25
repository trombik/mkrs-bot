# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/staff_users").to route_to("staff_users#index")
    end

    it "routes to #new" do
      expect(get: "/staff_users/new").to route_to("staff_users#new")
    end

    it "routes to #show" do
      expect(get: "/staff_users/1").to route_to("staff_users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/staff_users/1/edit").to route_to("staff_users#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/staff_users").to route_to("staff_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/staff_users/1").to route_to("staff_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/staff_users/1").to route_to("staff_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/staff_users/1").to route_to("staff_users#destroy", id: "1")
    end
  end
end
