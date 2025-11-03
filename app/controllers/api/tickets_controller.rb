module Api
  class TicketsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @tickets = Ticket.includes(:excavator)
    end

    def create
      data = JSON.parse(request.body.read).deep_transform_keys!(&:underscore)

      @ticket = Ticket.new(extract_model(data, Ticket))

      @excavator = @ticket.build_excavator(extract_model(data, Excavator))

      if @ticket.save
        render json: @ticket, status: :created
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end

    private

    def extract_model(data, model)
      return {} unless data.is_a?(Hash)

      data.each_with_object({}) do |(k, v), ticket|
        Rails.logger.info("#{model.class}: #{k}, #{v}")
        key = k.to_s.underscore
        if model.column_names.include? key
          ticket[key] = v
        else
          ticket.merge!(extract_model(v, model))
        end
      end
    end
  end
end