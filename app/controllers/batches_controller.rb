class BatchesController < ApplicationController
  
  before_filter :assert_admin

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(params[:batch])
    if @batch.save
      redirect_to startups_path, notice: 'Batch created.'
    else
      render :new
      flash.now[:alert] = 'Batch not created.'
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

end
