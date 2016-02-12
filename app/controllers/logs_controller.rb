class LogsController < ApplicationController
  def index
    @logs = Log.all.order(date: :desc, subject_id: :asc)
    @count = Log.distinct.count(:date)
  end

  def new
    @logs = Log.new
  end

  def create
    #reading
    unless log_params[:reading].blank? and log_params[:reading_book_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 1, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:reading], :book_id => log_params[:reading_book_id])
    end

    #writing
    unless log_params[:writing].blank? and log_params[:writing_book_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 2, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:writing], :book_id => log_params[:writing_book_id])
    end

    #math
    unless log_params[:math].blank? and log_params[:math_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 3, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:math], :book_id => log_params[:math_book_id])
    end

    #science
    unless log_params[:science].blank? and log_params[:science_book_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 4, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:science], :book_id => log_params[:science_book_id])
    end

    #social_studies
    unless log_params[:social_studies].blank? and log_params[:social_studies_book_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 5, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:social_studies], :book_id => log_params[:social_studies_book_id])
    end

    redirect_to controller: "logs", action: "index"
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update_attributes(log_params)
      redirect_to controller: "logs", action: "index"
    else
      render "edit"
    end
  end

  private

  def log_params
    params.require(:log).permit(:student_id, :subject_id, :teacher_id, :date, :description, :reading, :writing, :math, :science, :social_studies, :reading_book_id, :writing_book_id, :math_book_id, :science_book_id, :social_studies_book_id)
  end
end
