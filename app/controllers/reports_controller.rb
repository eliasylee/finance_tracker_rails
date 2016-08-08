class ReportsController < ApplicationController
  before_action

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id

    if @report.save
      redirect_to report_url(@report)
    else
      flash.now[:errors] = @report.errors.full_messages
      redirect_to user_url(@report.user)
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to report_url(@report)
    else
      flash.now[:errors] = @report.errors.full_messages
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to user_url(current_user)
  end

  private

  def report_params
    params.require(:report).permit(:name)
  end

  def correct_user
    @report = Report.find(params[:id])
    if current_user.id != @report.user_id
      redirect_to user_url(current_user)
    end
  end
end
