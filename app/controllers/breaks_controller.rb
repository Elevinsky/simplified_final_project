class BreaksController < ApplicationController
  def index
    @breaks = Break.page(params[:page]).per(10)

    render("breaks/index.html.erb")
  end

  def show
    @break = Break.find(params[:id])

    render("breaks/show.html.erb")
  end

  def new
    @break = Break.new

    render("breaks/new.html.erb")
  end

  def create
    @break = Break.new

    @break.trainer_id = params[:trainer_id]
    @break.start = params[:start]
    @break.end = params[:end]

    save_status = @break.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/breaks/new", "/create_break"
        redirect_to("/breaks")
      else
        redirect_back(:fallback_location => "/", :notice => "Break created successfully.")
      end
    else
      render("breaks/new.html.erb")
    end
  end

  def edit
    @break = Break.find(params[:id])

    render("breaks/edit.html.erb")
  end

  def update
    @break = Break.find(params[:id])

    @break.trainer_id = params[:trainer_id]
    @break.start = params[:start]
    @break.end = params[:end]

    save_status = @break.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/breaks/#{@break.id}/edit", "/update_break"
        redirect_to("/breaks/#{@break.id}", :notice => "Break updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Break updated successfully.")
      end
    else
      render("breaks/edit.html.erb")
    end
  end

  def destroy
    @break = Break.find(params[:id])

    @break.destroy

    if URI(request.referer).path == "/breaks/#{@break.id}"
      redirect_to("/", :notice => "Break deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Break deleted.")
    end
  end
end
