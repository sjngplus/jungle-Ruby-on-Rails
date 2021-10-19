require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'Validations' do

    it 'Throws an error if password length is too short' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testp',
        password_confirmation: 'testp'       
      })      
      expect(test_user.errors.full_messages).to eq ["Password is too short (minimum is 6 characters)"]      
    end

    it 'Throws an error if password confirmation does not match' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw23',
        password_confirmation: 'testp23'      
      })      
      expect(test_user.errors.full_messages.first).to eq "Password confirmation doesn't match Password"   
    end

    it 'Throws an error if email already exists in db' do
      test_user1 = User.create ({
        first_name: 'Bane',
        last_name: 'Shadow',
        email: 'johnd@rspec.com',
        password: 'goodpwss',
        password_confirmation: 'goodpwss'   
      })      
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw12',
        password_confirmation: 'testpw12'
      })      
      expect(test_user.errors.full_messages).to eq ["Email has already been taken"]      
    end

  end


  describe '.authenticate_with_credentials' do

    it 'Return the user object if credentials are authenticated' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw123',
        password_confirmation: 'testpw123'
      })
      login_user = User.authenticate_with_credentials('johnd@rspec.com', 'testpw123')
      expect(login_user).to have_attributes(first_name: 'John', last_name: 'Doe', email: 'johnd@rspec.com')
    end

    it 'Return the user object even if user\'s correct email has white spaces around it' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw123',
        password_confirmation: 'testpw123'
      })
      login_user = User.authenticate_with_credentials(' johnd@rspec.com ', 'testpw123')
      expect(login_user).to have_attributes(first_name: 'John', last_name: 'Doe', email: 'johnd@rspec.com')
    end

    it 'Return the user object after authenticating. User email should be case insensitive' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw123',
        password_confirmation: 'testpw123'
      })
      login_user = User.authenticate_with_credentials('JOhnd@rspEC.com', 'testpw123')
      expect(login_user).to have_attributes(first_name: 'John', last_name: 'Doe', email: 'johnd@rspec.com')
    end

    it 'Return nil if user entered email is not found in the db' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw123',
        password_confirmation: 'testpw123'
      })
      login_user = User.authenticate_with_credentials('johnd@rspe.com', 'testpw123')
      expect(login_user).to eq nil
    end

    it 'Return nil if user entered password is incorrect' do
      test_user = User.create ({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnd@rspec.com',
        password: 'testpw123',
        password_confirmation: 'testpw123'
      })
      login_user = User.authenticate_with_credentials('johnd@rspec.com', 'testp123')
      expect(login_user).to eq nil
    end

  end



end
