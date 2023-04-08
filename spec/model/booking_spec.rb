require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :each do
    @user = User.create(email: 'a@a', password: '123456')
    @swim = SwimClass.create(booked: true)
    @booking = Booking.create(user: @user, swim_class: @swim)
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(@booking.user).to be(@user)
    end
    
    it 'belongs to a swim_class' do
      expect(@booking.swim_class).to be(@swim)
    end
  end
end
