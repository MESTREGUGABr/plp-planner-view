class PlannerViewsController < ApplicationController
    before_action :set_planner_view, only: %i[show edit update destroy]
  
    # GET /planner_views
    # GET /planner_views.json
    def index
      @planner_views = PlannerView.all
    end
  
    # GET /planner_views/1
    # GET /planner_views/1.json
    def show
    end
  
    # GET /planner_views/new
    def new
      @planner_view = PlannerView.new
    end
  
    # GET /planner_views/1/edit
    def edit
    end
  
    # POST /planner_views
    # POST /planner_views.json
    def create
      @planner_view = PlannerView.new(planner_view_params)
  
      respond_to do |format|
        if @planner_view.save
          format.html { redirect_to @planner_view, notice: 'Planner view was successfully created.' }
          format.json { render :show, status: :created, location: @planner_view }
        else
          format.html { render :new }
          format.json { render json: @planner_view.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /planner_views/1
    # PATCH/PUT /planner_views/1.json
    def update
      respond_to do |format|
        if @planner_view.update(planner_view_params)
          format.html { redirect_to @planner_view, notice: 'Planner view was successfully updated.' }
          format.json { render :show, status: :ok, location: @planner_view }
        else
          format.html { render :edit }
          format.json { render json: @planner_view.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /planner_views/1
    # DELETE /planner_views/1.json
    def destroy
      @planner_view.destroy
      respond_to do |format|
        format.html { redirect_to planner_views_url, notice: 'Planner view was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_planner_view
        @planner_view = PlannerView.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def planner_view_params
        params.require(:planner_view).permit(:nome, :user_id)
      end
  end
  