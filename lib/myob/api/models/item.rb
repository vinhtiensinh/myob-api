module Myob
  module Api
    module Model
      class Item < Base
        def model_route
          'Inventory/Item'
        end

        def save(object)
          response = super
          if response.body && response.body != ''
            response
          elsif response && response.headers['location']
            {'UID' => response.headers['location'].split('/').last}
          end
        end
      end
    end
  end
end
