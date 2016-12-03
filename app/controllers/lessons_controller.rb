class LessonsController < ApplicationController

  def current_user_must_be_lesson_student
    lesson = Lesson.find(params[:id])

    unless current_user == lesson.student
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @lesson_options = ['9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM', '7:30 PM']
    @weekday = ['Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun']
    @q = Lesson.ransack(params[:q])
    @lessons = @q.result(:distinct => true).includes(:student, :trainer, :cancellation_note).page(params[:page]).per(10)

    @week = params[:id]
    render("lessons/index.html.erb")
  end

  def show
    @lesson = Lesson.find(params[:id])

    render("lessons/show.html.erb")
  end

  def new
    @lesson = Lesson.new

    @time = params[:id]
    @cleantime = @time.gsub( "_", " ")
    @chronictime = Chronic.parse(@cleantime)


    render("lessons/new.html.erb")
  end

  def create
    @lesson = Lesson.new

    @lesson.trainer_id = params[:trainer_id]
    @lesson.lesson_time = params[:lesson_time]
    @lesson.student_id = params[:student_id]

    save_status = @lesson.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lessons/new", "/create_lesson"
        redirect_to("/lessons")
      else
        redirect_back(:fallback_location => "/", :notice => "Lesson created successfully.")
      end
    else
      render("lessons/new.html.erb")
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])

    render("lessons/edit.html.erb")
  end

  def update
    @lesson = Lesson.find(params[:id])

    @lesson.trainer_id = params[:trainer_id]
    @lesson.lesson_time = params[:lesson_time]
    @lesson.student_id = params[:student_id]

    save_status = @lesson.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lessons/#{@lesson.id}/edit", "/update_lesson"
        redirect_to("/lessons/#{@lesson.id}", :notice => "Lesson updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Lesson updated successfully.")
      end
    else
      render("lessons/edit.html.erb")
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    @lesson.destroy

    if URI(request.referer).path == "/lessons/#{@lesson.id}"
      redirect_to("/", :notice => "Lesson deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Lesson deleted.")
    end
  end
end
