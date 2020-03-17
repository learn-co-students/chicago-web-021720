class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @cohorts = Cohort.all
  end

  def create
    p params
    p params.require(:student)
    p params.require(:student).permit
    p student_params
    Student.create(student_params)
    redirect_to students_path
  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def student_params
    params.require(:student).permit(:name, :cohort_id)
  end
end
