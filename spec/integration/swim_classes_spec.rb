require 'swagger_helper'

describe 'Swim class API' do
  path '/swim_classes' do
    post 'Creates a Swim class' do
      tags 'SwimClasses'
      consumes 'application/json', 'application/xml'
      parameter name: :swim_class, in: :body, schema: {
        type: :object,
        properties: {
          booked: { type: :boolean }
        },
        required: []
      }

      response '201', 'Swim class created' do
        let(:swim_class) { { booked: false } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:swim_class) { '' }
        run_test!
      end
    end
  end

  path '/swim_classes' do
    get 'Retrieves all Swim classes' do
      tags 'SwimClasses'
      produces 'application/json', 'application/xml'

      response '200', 'Swim classes found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string, nullable: true },
                   description: { type: :string, nullable: true },
                   location: { type: :string, nullable: true },
                   image: { type: :string, nullable: true },
                   fee: { type: :decimal, nullable: true },
                   booked: { type: :boolean },
                 },
                 required: []
               }
        run_test!
      end
    end
  end

  path '/swim_classes/{id}' do
    get 'Retrieves a Swim class' do
      tags 'SwimClasses'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Swim classes found' do
        schema type: :object,
               properties: {
                 booked: { type: :boolean }
               },
               required: %w[id]

        let(:id) { SwimClass.create(booked: false).id }
        run_test!
      end

      response '404', 'Swim class not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
