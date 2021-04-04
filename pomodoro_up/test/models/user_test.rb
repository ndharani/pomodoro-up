require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid credentails cause user to pass validation" do
    user_credentials = {
      "username": "valid_username",
      "email": "valid_email_address@domain.com",
      "password": "valid_password",
    }
    @user = User.create(user_credentials)
    assert @user.valid?, "Valid user failed validation"
  end

  test "missing credentails cause user to fail validation" do
    credentials_missing_password = {
      "username": "valid_username",
      "email": "valid_email_address@domain.com",
    }
    @user = User.create(credentials_missing_password)
    assert @user.invalid?, "User without password passed validation"

    credentials_missing_username = {
      "email": "valid_email_address@domain.com",
      "password": "valid_password",
    }
    @user2 = User.create(credentials_missing_username)
    assert @user2.invalid?, "User without username passed validation"

    credentials_missing_email = {
      "username": "valid_username",
      "password": "valid_password",
    }
    @user3 = User.create(credentials_missing_email)
    assert @user3.invalid?, "User without email passed validation"
  end

  test "invalid email address causes user to fail validation" do
    user_credentials = {
      "username": "valid_username",
      "email": "invalid_email_address",
      "password": "valid_password",
    }
    @user = User.create(user_credentials)
    assert @user.invalid?, "User with invalid email address passed validation"
  end

  test "duplicate username causes user to fail validation" do
    user_credentials = {
      "username": "username",
      "email": "email_address@domain.com",
      "password": "valid_password",
    }
    @user = User.create(user_credentials)

    assert @user.valid?, "Valid user failed validation"

    user_credentials2 = {
      "username": "username",
      "email": "unique_email_address@domain.com",
      "password": "valid_password",
    }
    @user2 = User.create(user_credentials2)
    assert @user2.invalid?, "User with duplicate username passed validation"
  end

  test "duplicate email causes user to fail validation" do
    user_credentials = {
      "username": "username",
      "email": "email_address@domain.com",
      "password": "valid_password",
    }
    @user = User.create(user_credentials)

    assert @user.valid?, "Valid user failed validation"

    user_credentials2 = {
      "username": "unique_username",
      "email": "email_address@domain.com",
      "password": "valid_password",
    }
    @user2 = User.create(user_credentials2)
    assert @user2.invalid?, "User with duplicate email passed validation"
  end
end
