require 'swagger_helper'

describe 'Bookings API' do
  before :each do
    @user = User.create(email: 'f@o', password: '123456')
    @swim_class = SwimClass.create(booked: false)
  end

  path '/bookings' do
    get 'Retrieves all bookings' do
      tags 'Bookings'
      produces 'application/json', 'application/xml'

      response '200', 'Bookings found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   start_time: { type: :string, nullable: true },
                   end_time: { type: :string, nullable: true },
                   user_id: { type: :integer },
                   swim_class_id: { type: :integer }
                 },
                 required: []
               }
        run_test!
      end
    end
  end

  path '/bookings/{id}' do
    get 'Retrieves a booking' do
      tags 'Bookings'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Booking found' do
        schema type: :object,
               properties: {
                 user_id: { type: :integer },
                 swim_class_id: { type: :integer }
               },
               required: %w[id]

        let(:id) { Booking.create(user_id: @user.id, swim_class_id: @swim_class.id).id }
        run_test!
      end

      response '404', 'Booking not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/bookings' do
    post 'Creates a booking' do
      tags 'Bookings'
      consumes 'application/json', 'application/xml'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          swim_class_id: { type: :integer }
        },
        required: %w[user_id swim_class_id]
      }

      response '201', 'Booking created' do
        let(:booking) { { user_id: @user.id, swim_class_id: @swim_class.id } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { user_id: @user.id } }
        run_test!
      end
    end
  end
end
