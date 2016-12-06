class TrainersController < ApplicationController
  def index
    @q = Trainer.ransack(params[:q])
    @trainers = @q.result(:distinct => true).includes(:schedule_adjustments, :breaks, :lessons).page(params[:page]).per(10)

    render("trainers/index.html.erb")
  end

  def show
    @lesson = Lesson.new
    @break = Break.new
    @schedule_adjustment = ScheduleAdjustment.new
    @trainer = Trainer.find(params[:id])

    render("trainers/show.html.erb")
  end

  def new
    @trainer = Trainer.new

    render("trainers/new.html.erb")
  end

  def create
    @trainer = Trainer.new

    @trainer.name = params[:name]
    @trainer.tues_start_hour = params[:tues_start_hour]
    @trainer.tues_start_min = params[:tues_start_min]
    @trainer.tues_start_am_pm = params[:tues_start_am_pm]
    @trainer.wed_start_hour = params[:wed_start_hour]
    @trainer.wed_start_min = params[:wed_start_min]
    @trainer.wed_start_am_pm = params[:wed_start_am_pm]
    @trainer.thur_start_hour = params[:thur_start_hour]
    @trainer.thur_start_min = params[:thur_start_min]
    @trainer.thur_start_am_pm = params[:thur_start_am_pm]
    @trainer.fri_start_hour = params[:fri_start_hour]
    @trainer.fri_start_min = params[:fri_start_min]
    @trainer.fri_start_am_pm = params[:fri_start_am_pm]
    @trainer.sat_start_hour = params[:sat_start_hour]
    @trainer.sat_start_min = params[:sat_start_min]
    @trainer.sat_start_am_pm = params[:sat_start_am_pm]
    @trainer.sun_start_hour = params[:sun_start_hour]
    @trainer.sun_start_min = params[:sun_start_min]
    @trainer.sun_start_am_pm = params[:sun_start_am_pm]
    @trainer.tues_end_hour = params[:tues_end_hour]
    @trainer.tues_end_min = params[:tues_end_min]
    @trainer.tues_end_am_pm = params[:tues_end_am_pm]
    @trainer.wed_end_hour = params[:wed_end_hour]
    @trainer.wed_end_min = params[:wed_end_min]
    @trainer.wed_end_am_pm = params[:wed_end_am_pm]
    @trainer.thur_end_hour = params[:thur_end_hour]
    @trainer.thur_end_min = params[:thur_end_min]
    @trainer.thur_end_am_pm = params[:thur_end_am_pm]
    @trainer.fri_end_hour = params[:fri_end_hour]
    @trainer.fri_end_min = params[:fri_end_min]
    @trainer.fri_end_am_pm = params[:fri_end_am_pm]
    @trainer.sat_end_hour = params[:sat_end_hour]
    @trainer.sat_end_min = params[:sat_end_min]
    @trainer.sat_end_am_pm = params[:sat_end_am_pm]
    @trainer.sun_end_hour = params[:sun_end_hour]
    @trainer.sun_end_min = params[:sun_end_min]
    @trainer.sun_end_am_pm = params[:sun_end_am_pm]

    save_status = @trainer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/trainers/new", "/create_trainer"
        redirect_to("/trainers")
      else
        redirect_to("/trainers", :notice => "Trainer created successfully.")
      end
    else
      render("trainers/new.html.erb")
    end
  end

  def edit
    @trainer = Trainer.find(params[:id])

    render("trainers/edit.html.erb")
  end

  def update
    @trainer = Trainer.find(params[:id])

    @trainer.name = params[:name]
    @trainer.tues_start_hour = params[:tues_start_hour]
    @trainer.tues_start_min = params[:tues_start_min]
    @trainer.tues_start_am_pm = params[:tues_start_am_pm]
    @trainer.wed_start_hour = params[:wed_start_hour]
    @trainer.wed_start_min = params[:wed_start_min]
    @trainer.wed_start_am_pm = params[:wed_start_am_pm]
    @trainer.thur_start_hour = params[:thur_start_hour]
    @trainer.thur_start_min = params[:thur_start_min]
    @trainer.thur_start_am_pm = params[:thur_start_am_pm]
    @trainer.fri_start_hour = params[:fri_start_hour]
    @trainer.fri_start_min = params[:fri_start_min]
    @trainer.fri_start_am_pm = params[:fri_start_am_pm]
    @trainer.sat_start_hour = params[:sat_start_hour]
    @trainer.sat_start_min = params[:sat_start_min]
    @trainer.sat_start_am_pm = params[:sat_start_am_pm]
    @trainer.sun_start_hour = params[:sun_start_hour]
    @trainer.sun_start_min = params[:sun_start_min]
    @trainer.sun_start_am_pm = params[:sun_start_am_pm]
    @trainer.tues_end_hour = params[:tues_end_hour]
    @trainer.tues_end_min = params[:tues_end_min]
    @trainer.tues_end_am_pm = params[:tues_end_am_pm]
    @trainer.wed_end_hour = params[:wed_end_hour]
    @trainer.wed_end_min = params[:wed_end_min]
    @trainer.wed_end_am_pm = params[:wed_end_am_pm]
    @trainer.thur_end_hour = params[:thur_end_hour]
    @trainer.thur_end_min = params[:thur_end_min]
    @trainer.thur_end_am_pm = params[:thur_end_am_pm]
    @trainer.fri_end_hour = params[:fri_end_hour]
    @trainer.fri_end_min = params[:fri_end_min]
    @trainer.fri_end_am_pm = params[:fri_end_am_pm]
    @trainer.sat_end_hour = params[:sat_end_hour]
    @trainer.sat_end_min = params[:sat_end_min]
    @trainer.sat_end_am_pm = params[:sat_end_am_pm]
    @trainer.sun_end_hour = params[:sun_end_hour]
    @trainer.sun_end_min = params[:sun_end_min]
    @trainer.sun_end_am_pm = params[:sun_end_am_pm]

    save_status = @trainer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/trainers/#{@trainer.id}/edit", "/update_trainer"
        redirect_to("/trainers/", :notice => "Trainer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Trainer updated successfully.")
      end
    else
      render("trainers/edit.html.erb")
    end
  end

  def destroy
    @trainer = Trainer.find(params[:id])

    @trainer.destroy

    if URI(request.referer).path == "/trainers/#{@trainer.id}"
      redirect_to("/", :notice => "Trainer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Trainer deleted.")
    end
  end
end
