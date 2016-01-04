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
    unless log_params[:reading].blank? and log_params[:book_id].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 1, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:reading], :book_id => log_params[:book_id])
    end

    #writing
    unless log_params[:writing].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 2, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:writing])
    end

    #math
    unless log_params[:math].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 3, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:math])
    end

    #science
    unless log_params[:science].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 4, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:science])
    end

    #social_studies
    unless log_params[:social_studies].blank?
      Log.create(:student_id => log_params[:student_id], :subject_id => 5, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:social_studies])
    end

    redirect_to controller: "logs", action: "index"
  end

  private

  def log_params
    params.require(:log).permit(:student_id, :subject_id, :teacher_id, :date, :reading, :writing, :math, :science, :social_studies, :book_id)
  end
end
