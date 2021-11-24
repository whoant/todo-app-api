module ExceptionHandler
	extend ActiveSupport::Concern

	included do
		rescue_from ActiveRecord::RecordNotFound do |e|
			json_response({ message: e.message }, :not_found)
		end

		rescue_from ActiveRecord::RecordInvalid do |e|
			json_response({ message: e.message }, :unprocessable_entity)
		end

		rescue_from NoMethodError do |e|
			p e
			json_response({ message: 'Item does not exist' }, :unprocessable_entity)
		end
	end
end
