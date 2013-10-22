class RemarksController < ApplicationController
  def create
    @remark = Remark.new(params[:remark])
    @comment = @remark.comment

    respond_to do |format|
      if @remark.save
        format.html { redirect_to @comment, notice: 'Comment has been submitted for approval.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end

