# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def create
    @student = Student.new(students_params)
    if @student.save
      flash[:notice] = "you have successfully signed up"
      redirect_to @student
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @student.update(students_params)
      flash[:notice] = "you have been successfilly updated your profile"
      redirect_to @student
    else
      render "edit"
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
