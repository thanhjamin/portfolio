class RemarksController < ApplicationController
  before_filter :load_remarkable

  def create
    @remark = @remarkable.remarks.new(params[:remark])

      if @remark.save
        redirect_to @remarkable, notice: 'Comment has been submitted for approval.'
      else
       @remarks = policy_scope(@remarkable.remarks)
       instance_variable_set("@#{@resource.singularize}".to_sym, @remarkable)
       render template: "#{@resource}/show"
    end
  end

  def update
    @remark = Remark.find(params[:id])
    authorize @remark

    respond_to do |format|
      if @remark.update_attributes(params[:remark])
        format.html { redirect_to @remarkable, notice: 'Comment has been approved.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @remarkable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @remark = Remark.find(params[:id])
    authorize @remark
    @remark.destroy

    respond_to do |format|
      format.html { redirect_to @remarkable, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def load_remarkable
    @resource, id = request.path.split('/')[1, 2]
    @remarkable = @resource.singularize.classify.constantize.find(id)
  end
end

