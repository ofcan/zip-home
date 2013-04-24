class BatchesController < ApplicationController
  
  before_filter :assert_current_user, :except => :show
  before_filter :assert_admin, :except => :show
  before_filter :find_batch, :only => [:edit, :show, :update, :destroy]

  def show
  end

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
  end

  def update
    if @batch.update_attributes(params[:batch])
      redirect_to @batch, notice: 'Batch updated.'
    else
      render :edit
      flash.now[:alert] = 'Batch not updated.'
    end
  end

  def destroy
    @batch.destroy
    redirect_to startups_path, notice: 'Batch destroyed.'
  end

  private

  def find_batch
    @batch = Batch.find(params[:id])
  end

end
