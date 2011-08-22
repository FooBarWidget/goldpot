class SpendingsController < ApplicationController
  before_filter :fetch_period
  
  # GET /spendings
  # GET /spendings.json
  def index
    @spendings = @period.spendings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @spendings }
    end
  end

  # GET /spendings/1
  # GET /spendings/1.json
  def show
    @spending = Spending.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @spending }
    end
  end

  # GET /spendings/new
  # GET /spendings/new.json
  def new
    @spending = Spending.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @spending }
    end
  end

  # GET /spendings/1/edit
  def edit
    @spending = @period.spendings.find(params[:id])
  end

  def link_to(*args)
    render_to_string(:inline => '<%= link_to(*args) %>', :locals => { :args => args })
  end

  # POST /spendings
  # POST /spendings.json
  def create
    @spending = Spending.new(params[:spending])

    respond_to do |format|
      if @spending.save
        format.html do
          link = link_to "Uitgave #{@spending.id}", [@period, @spending]
          redirect_to new_period_spending_path(@period),
            :notice => "#{link} succesvol opgeslagen!".html_safe
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
    @spending = @period.spendings.find(params[:id])

    respond_to do |format|
      if @spending.update_attributes(params[:spending])
        format.html { redirect_to [@period, @spending], :notice => 'Spending was successfully updated.' }
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
    @spending = @period.spendings.find(params[:id])
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to period_spendings_url(@period) }
      format.json { head :ok }
    end
  end

private
  def fetch_period
    @period = Period.parse(params[:period_id])
  end
end
