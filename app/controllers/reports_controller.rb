class ReportsController < ApplicationController

  def create
    @report = Report.new(report_params)

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

    if @report.save
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

end
