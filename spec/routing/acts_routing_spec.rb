# frozen_string_literal: true

require "rails_helper"

RSpec.describe ActsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/acts").to route_to("acts#index")
    end

    it "routes to #new" do
      expect(get: "/acts/new").to route_to("acts#new")
    end

    it "routes to #show" do
      expect(get: "/acts/1").to route_to("acts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/acts/1/edit").to route_to("acts#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/acts").to route_to("acts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/acts/1").to route_to("acts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/acts/1").to route_to("acts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/acts/1").to route_to("acts#destroy", id: "1")
    end
  end
end
