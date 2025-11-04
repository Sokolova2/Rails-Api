# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { 'id + 1' }
    sequence_number { '123' }
    request_type { 'normal' }
    response_due_date_time { Time.current.utc }
    primary_service_area_code { 'ZGL103' }
    additional_service_area_codes { 'ZGL103' }
    well_known_text do
      'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))'
    end
  end
end
