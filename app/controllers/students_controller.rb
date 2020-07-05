class StudentsController < ApplicationController
    def index
        @students  = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(students_params)
        if @student.save
            flash[:success] = "you ahave successfully signed up"
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    
    def students_params
        params.require(:student).permit(:name, :email)
    end
end