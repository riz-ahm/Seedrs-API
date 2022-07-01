module Queries
  module Filter
    class Campaign < Queries::Base
      def call
        @relation = @relation.where(organization_id: @params[:organization_ids]) if @params[:organization_ids]
        @relation = @relation.where(id: @params[:person_ids]) if @params[:person_ids]
        if @params[:archived]
          if @params[:archived] == 'true'
            @relation = @relation.archived
          else
            @relation = @relation.active
          end
        end

        if %w(created_at updated_at).include?(@params[:filter]) && @params[:start_date] && @params[:end_date]
          start_date = Date.parse @params[:start_date] rescue nil
          end_date = Date.parse @params[:end_date] rescue nil
          @relation = @relation.where("people.#{@params[:filter]}::date BETWEEN ? AND ?",
                                      start_date, end_date)
        end

        @relation
      end
    end
  end
end
