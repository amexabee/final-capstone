require 'rails_helper'

RSpec.describe SwimClass, type: :model do
  before :each do
    @user = User.create(email: 'a@a', password: '123456')
    @swim = SwimClass.create(booked: true)
    @booking1 = Booking.create(user: @user, swim_class: @swim)
    @booking2 = Booking.create(user: @user, swim_class: @swim)
  end

  describe 'associations' do
    it 'has many bookings' do
      expect(@swim.bookings.count).to eq(2)
    end
  end
end
