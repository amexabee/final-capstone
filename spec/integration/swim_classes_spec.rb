require 'swagger_helper'

describe 'Bookings API' do

  path '/swim_classes' do

    post 'Creates a Swim class' do
      tags 'SwimClasses'
      consumes 'application/json', 'application/xml'
      parameter name: :swim_class, in: :body, schema: {
        type: :object,
        properties: {
          booked: {type: :boolean}
        },
        required: [ 'booked' ]
      }
      
      response '201', 'Booking created' do
        let(:swim_class) { { booked: false } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:swim_class) { {  } }
        run_test!
      end
    end
  end

  path '/swim_classes' do

    get 'Retrieves all Swim classes' do
      tags 'SwimClasses'
      produces 'application/json', 'application/xml'
      parameter name: :swim_class, :in => :path, :type => :string

      response '200', 'Swim classes found' do
        schema type: :object,
        properties: {
            booked: {type: :boolean}
        },
          required: [ ]

        let(:booking) { }
        run_test!
      end

      response '404', 'Swim classes not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/swim_classes/{id}' do

    get 'Retrieves a swim class' do
      tags 'SwimClasses'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'Swim classes found' do
        schema type: :object,
        properties: {
          booked: {type: :boolean} 
        },
          required: [ 'id', 'booked' ]

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