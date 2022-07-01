class InvestmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @investment = Investment.new(investment_params)
    if @investment.save
      render json: { errors: nil }
    else
      render json: { error: validation_messages(@investment.errors.messages) },
             status: :unprocessable_entity
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :investor_name, :campaign_id)
  end

  def validation_messages(validation_messages)
    validation_messages.each_with_object({}) do |(key, value), errors|
      errors[key] = value.to_sentence
    end
  end
end
