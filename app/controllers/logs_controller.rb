class LogsController < ApplicationController
  def index
    @logs = Log.all.order(date: :desc, subject_id: :asc)
    @count = Log.distinct.count(:date)
  end

  def new
    @logs = Log.new
  end

  def create
    if logs = Log.create(log_params)
      flash[:success] = "Log entry saved"
    else
      flash[:error] = "Log entry not saved"
    end
    redirect_to controller: "logs", action: "index"
  end

  private

  def log_params
    params.require(:log).permit(:student_id, :subject_id, :teacher_id, :date, :description, :book_id)
  end
end
