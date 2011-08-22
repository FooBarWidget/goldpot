require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SpendingsController do

  # This should return the minimal set of attributes required to create a valid
  # Spending. As you add validations to Spending, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all spendings as @spendings" do
      spending = Spending.create! valid_attributes
      get :index
      assigns(:spendings).should eq([spending])
    end
  end

  describe "GET show" do
    it "assigns the requested spending as @spending" do
      spending = Spending.create! valid_attributes
      get :show, :id => spending.id.to_s
      assigns(:spending).should eq(spending)
    end
  end

  describe "GET new" do
    it "assigns a new spending as @spending" do
      get :new
      assigns(:spending).should be_a_new(Spending)
    end
  end

  describe "GET edit" do
    it "assigns the requested spending as @spending" do
      spending = Spending.create! valid_attributes
      get :edit, :id => spending.id.to_s
      assigns(:spending).should eq(spending)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spending" do
        expect {
          post :create, :spending => valid_attributes
        }.to change(Spending, :count).by(1)
      end

      it "assigns a newly created spending as @spending" do
        post :create, :spending => valid_attributes
        assigns(:spending).should be_a(Spending)
        assigns(:spending).should be_persisted
      end

      it "redirects to the created spending" do
        post :create, :spending => valid_attributes
        response.should redirect_to(Spending.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spending as @spending" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spending.any_instance.stub(:save).and_return(false)
        post :create, :spending => {}
        assigns(:spending).should be_a_new(Spending)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spending.any_instance.stub(:save).and_return(false)
        post :create, :spending => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spending" do
        spending = Spending.create! valid_attributes
        # Assuming there are no other spendings in the database, this
        # specifies that the Spending created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Spending.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => spending.id, :spending => {'these' => 'params'}
      end

      it "assigns the requested spending as @spending" do
        spending = Spending.create! valid_attributes
        put :update, :id => spending.id, :spending => valid_attributes
        assigns(:spending).should eq(spending)
      end

      it "redirects to the spending" do
        spending = Spending.create! valid_attributes
        put :update, :id => spending.id, :spending => valid_attributes
        response.should redirect_to(spending)
      end
    end

    describe "with invalid params" do
      it "assigns the spending as @spending" do
        spending = Spending.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spending.any_instance.stub(:save).and_return(false)
        put :update, :id => spending.id.to_s, :spending => {}
        assigns(:spending).should eq(spending)
      end

      it "re-renders the 'edit' template" do
        spending = Spending.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spending.any_instance.stub(:save).and_return(false)
        put :update, :id => spending.id.to_s, :spending => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spending" do
      spending = Spending.create! valid_attributes
      expect {
        delete :destroy, :id => spending.id.to_s
      }.to change(Spending, :count).by(-1)
    end

    it "redirects to the spendings list" do
      spending = Spending.create! valid_attributes
      delete :destroy, :id => spending.id.to_s
      response.should redirect_to(spendings_url)
    end
  end

end
