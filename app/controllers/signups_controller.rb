class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create #creates a new signup
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created #returns associated data
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time) #returns associated Activity where camper and activity exist
    end

    def render_not_found_response
        render json: { error: "Camper not found"}, status: :not_found #returns status code of 422
    end

    def render_unprocessable_entity_response(invalid) #returns error message and status code 422
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
