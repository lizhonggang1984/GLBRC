# app controller
class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @sessionid = session[:user_id]
    if @sessionid == nil
       redirect_to root_url    # redirect to login page if user is not logged in
    else    # set up all apps that can be passed to index page with all selected apps
      @user = User.find(@sessionid)    
      @apps = App.all
      @apps = @apps.where(user_id: @sessionid) # choose apps for current user
      @apps = @apps.where(status: true) # choose current user selected apps
      # @apps.sort_by(&:order)
      @apps = @apps.sort_by { |a| a[:order] }
    end
  end

  # used to test some function
  def indexTest
    @sessionid = session[:user_id]
    if @sessionid == nil
      redirect_to root_url    # redirect to login page if user is not logged in
    else    # set up all apps that can be passed to index page with all selected apps
      @user = User.find(@sessionid)
      @apps = App.all
      @apps = @apps.where(user_id: @sessionid) # choose apps for current user
      @apps = @apps.where(status: true) # choose current user selected apps
      # @apps.sort_by(&:order)
      @apps = @apps.sort_by { |a| a[:order] }
    end
  end

  # GET /apps/index_notSelect
  def index_notSelect
    @sessionid = session[:user_id]
    if @sessionid == nil   # go to login page if not logged in
       redirect_to root_url
    else    # set up all apps that can be passed to index_notSelecte page with all unselected apps
      @user = User.find(@sessionid)
      @apps = App.all
      @apps = @apps.where(user_id: @sessionid) # choose apps for current user
      @apps = @apps.where(status: false) # choose current user unselected apps
    end
  end

  # admin can find all apps and edit them in back-end as administrator
  def admin
    @sessionid = session[:user_id]
    if @sessionid == nil
       redirect_to root_url # go to login page if not logged in
    else 
    @user = User.find(@sessionid)    
    @apps = App.all
    end  
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @sessionid = session[:user_id]
    if @sessionid == nil
       redirect_to root_url
    end
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  def remove
    @app = App.find(params[:id])
  end

  def getOrder
    @sessionid = session[:user_id]
    if @sessionid == nil
      redirect_to root_url # go to login page if not logged in
    else
      @apps = App.all
      @apps = @apps.where(user_id: @sessionid) # choose apps for current user
      @app1 = @apps.find_by_name ('Google')
      @app2 = @apps.find_by_name ('Wisc')
      @app3 = @apps.find_by_name ('GLBRC')
      @app4 = @apps.find_by_name ('WEI')
      @app5 = @apps.find_by_name ('Twitter')
      @l1 = params[:l1]
      @l2 = params[:l2]
      @l3 = params[:l3]
      @l4 = params[:l4]
      @l5 = params[:l5]
      puts @l1
      puts @l2
      puts @l3
      puts @l4
      puts @l5
    end
  end

  def addback
    @app = App.find(params[:id])
  end

  def first
    @app = App.find(params[:id])
    @apps = App.all
  end

  # GET /apps/1/edit
  def edit
    @app = App.find(params[:id])
  end

  # POST /apps
  # POST /apps.json
  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    @app.user_id = session[:user_id]
    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
      if @app.update(app_params)
        redirect_to '/apps'
      else
        render :edit
      end
  end

  

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_params
      # params.require(:app).permit(:name, :description, :color, :status, :link, :user_id,:order,:priority)
    end
end
