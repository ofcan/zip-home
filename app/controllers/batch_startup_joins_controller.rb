class BatchStartupJoinsController < ApplicationController
  
  before_filter :find_batch
  before_filter :assert_current_user
  before_filter :assert_admin
  
  def create
    @batch_startup_join = @batch.batch_startup_joins.build
    @batch_startup_join.batch = @batch
    @batch_startup_join.startup = Startup.find(params[:batch_startup_join][:startup_id])
    if @batch_startup_join.save
      redirect_to edit_batch_path(@batch), notice: 'Startup added.'
    else
      redirect_to edit_batch_path(@batch), alert: 'Startup not added.'
    end
  end

  private

  def find_batch
    @batch = Batch.find(params[:batch_id])
  end

end
