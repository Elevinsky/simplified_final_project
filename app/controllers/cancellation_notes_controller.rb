class CancellationNotesController < ApplicationController
  def index
    @cancellation_notes = CancellationNote.page(params[:page]).per(10)

    render("cancellation_notes/index.html.erb")
  end

  def show
    @cancellation_note = CancellationNote.find(params[:id])

    render("cancellation_notes/show.html.erb")
  end

  def new
    @cancellation_note = CancellationNote.new

    render("cancellation_notes/new.html.erb")
  end

  def create
    @cancellation_note = CancellationNote.new

    @cancellation_note.lesson_id = params[:lesson_id]
    @cancellation_note.body = params[:body]

    save_status = @cancellation_note.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cancellation_notes/new", "/create_cancellation_note"
        redirect_to("/cancellation_notes")
      else
        redirect_back(:fallback_location => "/", :notice => "Cancellation note created successfully.")
      end
    else
      render("cancellation_notes/new.html.erb")
    end
  end

  def edit
    @cancellation_note = CancellationNote.find(params[:id])

    render("cancellation_notes/edit.html.erb")
  end

  def update
    @cancellation_note = CancellationNote.find(params[:id])

    @cancellation_note.lesson_id = params[:lesson_id]
    @cancellation_note.body = params[:body]

    save_status = @cancellation_note.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cancellation_notes/#{@cancellation_note.id}/edit", "/update_cancellation_note"
        redirect_to("/cancellation_notes/#{@cancellation_note.id}", :notice => "Cancellation note updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cancellation note updated successfully.")
      end
    else
      render("cancellation_notes/edit.html.erb")
    end
  end

  def destroy
    @cancellation_note = CancellationNote.find(params[:id])

    @cancellation_note.destroy

    if URI(request.referer).path == "/cancellation_notes/#{@cancellation_note.id}"
      redirect_to("/", :notice => "Cancellation note deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cancellation note deleted.")
    end
  end
end
