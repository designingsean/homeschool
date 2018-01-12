class LogsController < ApplicationController
  def index
    @logs = Log.current_school_year
    @student_counts = Log.student_counts
  end

  def new
    @logs = Log.new
  end

  def create
    #reading
    unless log_params[:reading].blank?
      Log.create(:record_id => log_params[:record_id], :subject_id => 1, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:reading])
    end

    #writing
    unless log_params[:writing].blank?
      Log.create(:record_id => log_params[:record_id], :subject_id => 2, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:writing])
    end

    #math
    unless log_params[:math].blank?
      Log.create(:record_id => log_params[:record_id], :subject_id => 3, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:math])
    end

    #science
    unless log_params[:science].blank?
      Log.create(:record_id => log_params[:record_id], :subject_id => 4, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:science])
    end

    #social_studies
    unless log_params[:social_studies].blank?
      Log.create(:record_id => log_params[:record_id], :subject_id => 5, :teacher_id => log_params[:teacher_id], :date => log_params[:date], :description => log_params[:social_studies])
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
    params.require(:log).permit(:record_id, :subject_id, :teacher_id, :date, :description, :reading, :writing, :math, :science, :social_studies)
  end
end
