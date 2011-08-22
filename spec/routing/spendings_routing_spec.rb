require "spec_helper"

describe SpendingsController do
  describe "routing" do

    it "routes to #index" do
      get("/spendings").should route_to("spendings#index")
    end

    it "routes to #new" do
      get("/spendings/new").should route_to("spendings#new")
    end

    it "routes to #show" do
      get("/spendings/1").should route_to("spendings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spendings/1/edit").should route_to("spendings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spendings").should route_to("spendings#create")
    end

    it "routes to #update" do
      put("/spendings/1").should route_to("spendings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spendings/1").should route_to("spendings#destroy", :id => "1")
    end

  end
end
