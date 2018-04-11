require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid registration information do not create a new user' do
    get users_new_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name: '',
          email: 'user@invalid',
          password: 'foo',
          password_confirmation: 'bar'
        }
      }
    end
    assert_template 'users/new'
    assert_select 'div.field_with_errors'
    assert_select 'ul.errors_list'
  end

  test 'valid signup information' do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name: 'Example User',
          email: 'user@example.com',
          password: 'Th3B3s$!-9A$$',
          password_confirmation: 'Th3B3s$!-9A$$'
        }
      }
    end

    follow_redirect!
    assert_template 'users/show'
  end
end
