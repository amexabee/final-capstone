require 'swagger_helper'

describe 'Users API' do
  path '/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json', 'application/xml'

      response '200', 'Users found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   email: { type: :string }
                 },
                 required: []
               }
        run_test!
      end
    end
  end
end
