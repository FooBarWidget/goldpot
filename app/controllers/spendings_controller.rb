class SpendingsController < ApplicationController
  before_filter :fetch_period, :only => :index
  
  def index
    if @period
      @spendings = @period.spendings
    else
      @spendings = Spending.all(:order => :date)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @spendings }
    end
  end

  def show
    @spending = Spending.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @spending }
    end
  end

  def new
    @spending = Spending.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @spending }
    end
  end

  # GET /spendings/1/edit
  def edit
    @spending = Spending.find(params[:id])
  end

  # POST /spendings
  # POST /spendings.json
  def create
    @spending = Spending.new(params[:spending])

    respond_to do |format|
      if @spending.save
        format.html do
          link = link_to "Uitgave #{@spending.id}", @spending
          notice = "#{link} succesvol opgeslagen!".html_safe
          redirect_to new_spending_path, :notice => notice
        end
        format.json { render :json => @spending, :status => :created, :location => @spending }
      else
        format.html { render :action => "new" }
        format.json { render :json => @spending.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spendings/1
  # PUT /spendings/1.json
  def update
    @spending = Spending.find(params[:id])

    respond_to do |format|
      if @spending.update_attributes(params[:spending])
        format.html do
          link = link_to "Uitgave #{@spending.id}", @spending
          notice = "#{link} aangepast!".html_safe
          redirect_to spendings_url, :notice => notice
        end
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @spending.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spendings/1
  # DELETE /spendings/1.json
  def destroy
    @spending = Spending.find(params[:id])
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to spendings_url }
      format.json { head :ok }
    end
  end

private
  def fetch_period
    @period = Period.parse(params[:period_id]) if params[:period_id]
  end
end
