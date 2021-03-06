class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  helper_method :grab_child
  helper_method :event_titles
  before_action :authenticate_user
  before_action :logged_in_user

  # GET /events
  # GET /events.json
  # def user_type
  #   if @logged_in_user = Mediator
  # end

  def index
    @events = Event.all.order(:date)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    # @approved_parents = approved_parents(@event)
  end

  def grab_child
    @grab_child = Child.find(@event.child_id).first_name
  end

  # def event_titles
  #   @event_titles = ["Birthday party", "Doctor's appointment", "Dentist's appointment", "After School music class",
  #       "After School sport practice", "After school other activity", "Play date"]
  # end

  # GET /events/new

  def new
    @event = Event.new
    @event_titles = ["Birthday party", "Doctor's appointment", "Dentist's appointment", "After school music class",
        "After school sport practice", "After school other activity", "Play date", "Other..."]
    @event_locations = ["123 Main St", "543 Lucas Dr", "786 Miami Ave", "617 Brighton Ln",
        "7053 Green Ave", "8853 Independence Dr", "3172 Guerrilla Ct"]
  end

  # GET /events/1/edit
  def edit
  end

  # def create_approval
  #   @approval = Approval.new(approval_params)
  # end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    # create_approval

    respond_to do |format|
      if
        @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def approved_parents(event_id)
  #   @approved_parents = []
  #   approved_parents
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # def approved_parents(event)
    #   approved_parents = []
    #   approvals = event.approvals
    #   approvals.each do |approval|
    #     if approval.parent_approval
    #       user = User.find(approval[:parent_id])
    #       approved_parents.push({user: user, approved_at: approval.updated_at})
    #     end
    #   end
    #   approved_parents
    # end


    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :time, :parent_id, :child_id, :mediator_id, :pending, :user_id, :location)
    end

end
