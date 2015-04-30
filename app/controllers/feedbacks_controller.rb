class FeedbacksController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :update, :show]

	def show
	    @feedback = Feedback.find(params[:id])
	end


	def create
	    @feedback = current_user.feedbacks.build(feedback_params)
	    #@feedback.user_id = current_user.id
	    @feedback.status = 0
	    if @feedback.save
	      flash[:success] = "Feedback request created!"
	      redirect_to current_user
	    else
	      flash[:danger] = "Feedback request could not be created"
	      redirect_to current_user
	    end
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end


	def update
		@feedback = Feedback.find(params[:id])
		@feedback.status = 1
	    if @feedback.update_attributes(feedback_params)
	      flash[:success] = "Feedback Submitted"
	      redirect_to current_user
	    else
	      flash[:danger] = "Feedback not completed"
	      redirect_to current_user
	    end
	end

	private

    def feedback_params
      params.require(:feedback).permit(:user_id, :appearance, 
      									:experience, :organization, 
      									:overall, :score, :status, :resume)
    end
end
