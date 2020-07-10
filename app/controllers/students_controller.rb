# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    set_student
  end

  def create
    @student = Student.new(students_params)
    if @student.save
      flash[:notice] = "you have successfully signed up"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    set_student
  end

  def update
    set_student
    if @student.update(students_params)
      flash[:notice] = "you have been successfilly updated your profile"
      redirect_to student_path(@student)
    else
      render @student
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def students_params
      params.require(:student).permit(:name, :email)
    end
end
