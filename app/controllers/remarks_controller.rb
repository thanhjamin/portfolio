class RemarksController < ApplicationController
  def create
    @remark = Remark.new(params[:remark])
    @comment = @remark.comment

    respond_to do |format|
      if @remark.save
        format.html { redirect_to @comment, notice: 'Comment has been submitted for approval.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render template: "comments/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    load_comment_remark
    authorize @remark

    respond_to do |format|
      if @remark.update_attributes(params[:remark])
        format.html { redirect_to @comment, notice: 'Comment has been approved.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    load_comment_remark
    authorize @remark
    @remark.destroy

    respond_to do |format|
      format.html { redirect_to @comment, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def load_comment_remark
    @remark = Remark.find(params[:id])
    @comment = @remark.comment
  end
end

