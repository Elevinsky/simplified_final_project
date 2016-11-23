class ScheduleAdjustmentsController < ApplicationController
  def index
    @schedule_adjustments = ScheduleAdjustment.all

    render("schedule_adjustments/index.html.erb")
  end

  def show
    @schedule_adjustment = ScheduleAdjustment.find(params[:id])

    render("schedule_adjustments/show.html.erb")
  end

  def new
    @schedule_adjustment = ScheduleAdjustment.new

    render("schedule_adjustments/new.html.erb")
  end

  def create
    @schedule_adjustment = ScheduleAdjustment.new

    @schedule_adjustment.trainer_id = params[:trainer_id]
    @schedule_adjustment.adjusted_start = params[:adjusted_start]
    @schedule_adjustment.adjusted_end = params[:adjusted_end]

    save_status = @schedule_adjustment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schedule_adjustments/new", "/create_schedule_adjustment"
        redirect_to("/schedule_adjustments")
      else
        redirect_back(:fallback_location => "/", :notice => "Schedule adjustment created successfully.")
      end
    else
      render("schedule_adjustments/new.html.erb")
    end
  end

  def edit
    @schedule_adjustment = ScheduleAdjustment.find(params[:id])

    render("schedule_adjustments/edit.html.erb")
  end

  def update
    @schedule_adjustment = ScheduleAdjustment.find(params[:id])

    @schedule_adjustment.trainer_id = params[:trainer_id]
    @schedule_adjustment.adjusted_start = params[:adjusted_start]
    @schedule_adjustment.adjusted_end = params[:adjusted_end]

    save_status = @schedule_adjustment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schedule_adjustments/#{@schedule_adjustment.id}/edit", "/update_schedule_adjustment"
        redirect_to("/schedule_adjustments/#{@schedule_adjustment.id}", :notice => "Schedule adjustment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Schedule adjustment updated successfully.")
      end
    else
      render("schedule_adjustments/edit.html.erb")
    end
  end

  def destroy
    @schedule_adjustment = ScheduleAdjustment.find(params[:id])

    @schedule_adjustment.destroy

    if URI(request.referer).path == "/schedule_adjustments/#{@schedule_adjustment.id}"
      redirect_to("/", :notice => "Schedule adjustment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Schedule adjustment deleted.")
    end
  end
end
