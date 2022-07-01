module Queries
  module Filter
    class Campaign < Queries::Base
      def call
        @relation = @relation.where(sector: @params[:sectors]) if @params[:sectors]
        @relation = @relation.where(country: @params[:countries]) if @params[:countries]
        if @params[:percentage_raised_min] && @params[:percentage_raised_max]
          @relation = @relation.where(
            percentage_raised: @params[:percentage_raised_min]..@params[:percentage_raised_max]
          )
        end

        if @params[:target_amount_min] && @params[:target_amount_max]
          @relation = @relation.where(
            target_amount: @params[:target_amount_min]..@params[:target_amount_max]
          )
        end

        if @params[:investment_multiple_min] && @params[:investment_multiple_max]
          @relation = @relation.where(
            investment_multiple: @params[:investment_multiple_min]..@params[:investment_multiple_max]
          )
        end

        if @params[:amount_raised_min]
          filtered_relation = @relation.select do |campaign|
            campaign.amount_raised >= @params[:amount_raised_min].to_f
          end
          @relation = @relation.where(id: filtered_relation.pluck(:id))
        end

        if @params[:investor_count_min]
          filtered_relation = @relation.select do |campaign|
            campaign.investments.count >= @params[:investor_count_min].to_i
          end
          @relation = @relation.where(id: filtered_relation.pluck(:id))
        end

        @relation
      end
    end
  end
end
