class WorksController < ApplicationController
  before_filter :authenticate_via_token, only: :update

  def update
    @work = Work.find(params[:id])
    respond_to do |format|
      format.json do
        if @work && @work.update_attributes(work_params)
          head :ok, location: @work
        else
          render json: submission.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def work_params
    params.require(:work).permit(
      :description,
      :kind,
      infringing_urls_attributes: [:url],
      copyrighted_urls_attributes: [:url]
    )
  end
end
