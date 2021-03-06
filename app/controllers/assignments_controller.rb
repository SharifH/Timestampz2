class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
    @day_classes = DayClass.all
    @count = 0
  end

  def create
    @assignment = Assignment.new(params[:assignment]['0'])
    @assignment.day_class_id = params[:assignment]['0'][:day_class_id]
    if @assignment.save
      flash[:success] = "Assignment successfully created!"
      redirect_to assignments_path
    else
      redirect_to new_assignment_path
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @day_classes = DayClass.all.map{|c| [c.subject, c.id] }
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      flash[:success] = "Assignment successfully updated."
      redirect_to assignments_path
    else
      flash[:error] = @assignment.errors
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.delete
    redirect_to assignments_path
  end

  def add_form
    @day_classes = DayClass.all
    respond_to do |format|
      format.js
    end
  end
end