class WorksController < ApplicationController
  before_filter :authenticate_via_token, only: :update

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_params)
    render nothing: true
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
