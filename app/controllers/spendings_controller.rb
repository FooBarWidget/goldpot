class SpendingsController < ApplicationController
  helper_method :new_spending_path, :edit_spending_path, :create_or_update_spending_path,
    :spending_path, :spendings_path
  
  before_filter :fetch_folder
  
  def index
    @spendings = @folder.spendings
    @aggregate = SpendingAggregate.new(@spendings)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @spendings }
    end
  end

  def show
    @spending = @folder.spendings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @spending }
    end
  end

  def new
    @spending = @folder.spendings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @spending }
    end
  end

  # GET /spendings/1/edit
  def edit
    @spending = @folder.spendings.find(params[:id])
  end
  
  # POST /spendings
  # POST /spendings.json
  def create
    @spending = @folder.spendings.build(params[:spending])

    respond_to do |format|
      if @spending.save
        format.html do
          link = link_to "Uitgave #{@spending.id}", spending_path(@spending)
          notice = "#{link} succesvol opgeslagen!".html_safe
          redirect_to new_spending_path, :notice => notice
        end
        format.json { render :json => @spending, :status => :created, :location => spending_path(@spending) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @spending.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spendings/1
  # PUT /spendings/1.json
  def update
    @spending = @folder.spendings.find(params[:id])

    respond_to do |format|
      if @spending.update_attributes(params[:spending])
        format.html do
          if request.xhr?
            render :partial => @spending
          else
            link = link_to "Uitgave #{@spending.id}", spending_path(@spending)
            notice = "#{link} aangepast!".html_safe
            redirect_to spendings_path, :notice => notice
          end
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
    @spending = @folder.spendings.find(params[:id])
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to spendings_path }
      format.json { head :ok }
    end
  end

private
  def fetch_folder
    @folder = Folder.find(params[:folder_id])
  end
  
  def new_spending_path
    new_folder_spending_path(@folder)
  end
  
  def edit_spending_path(spending)
    edit_folder_spending_path(@folder, spending)
  end
  
  def create_or_update_spending_path(spending)
    if spending.new_record?
      spendings_path
    else
      spending_path(spending)
    end
  end
  
  def spending_path(spending)
    folder_spending_path(@folder, spending)
  end
  
  def spendings_path
    folder_spendings_path(@folder)
  end
end
