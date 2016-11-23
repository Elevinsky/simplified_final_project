class LessonsController < ApplicationController
  def index
    @lessons = Lesson.page(params[:page]).per(10)

    render("lessons/index.html.erb")
  end

  def show
    @lesson = Lesson.find(params[:id])

    render("lessons/show.html.erb")
  end

  def new
    @lesson = Lesson.new

    render("lessons/new.html.erb")
  end

  def create
    @lesson = Lesson.new

    @lesson.trainer_id = params[:trainer_id]
    @lesson.student_id = params[:student_id]
    @lesson.lesson_time = params[:lesson_time]
    @lesson.checked_in = params[:checked_in]

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
    @lesson.student_id = params[:student_id]
    @lesson.lesson_time = params[:lesson_time]
    @lesson.checked_in = params[:checked_in]

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
