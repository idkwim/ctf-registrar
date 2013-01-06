Given /^I am on the homepage$/ do
  visit '/'
end

Given /^I expect an email$/ do
  @mail_expectation = Mail::Message.any_instance.expects(:deliver)
end

When /^I complete the initial user form$/ do
  @user_attrs = FactoryGirl.attributes_for :user

  fill_in 'user_username', with: @user_attrs[:username]
  fill_in 'user_password', with: @user_attrs[:password]
  click_on 'Create Account'
end

When /^I complete the secondary user form$/ do
  fill_in 'user_password_confirmation', with: @user_attrs[:password]
  fill_in 'user_email', with: @user_attrs[:email]
  fill_in 'user_email_confirmation', with: @user_attrs[:email]

  click_on 'Create Account'
end

Then /^I should be logged in$/ do
  login_expectation = "Logged in as #{@user_attrs[:email]}"
  assert page.has_content?(login_expectation), "Couldn't find #{login_expectation.inspect}"
end

Then /^.+ should have a .+ email$/ do
  invocation_count = @mail_expectation.instance_variable_get(:@invocation_count)
  assert invocation_count > 0, "Expected #{invocation_count} to be greater than zero."
end

Given /^I am signed in$/ do
  @user = FactoryGirl.create :user
  visit '/'
  fill_in 'user_username', with: @user.username
  fill_in 'user_password', with: @user.password
  click_on 'Log In'
end

When /^I complete the team creation form$/ do
  @team_attrs = FactoryGirl.attributes_for :team
  fill_in 'team_name', with: @team_attrs[:name]
  fill_in 'team_tag', with: @team_attrs[:tag]
  fill_in 'team_password', with: @team_attrs[:password]
  click_on 'Create Team'
end

Then /^I should own a team$/ do
  team_expectation = "You're the registered owner of #{@team_attrs[:name]}."
  assert page.has_content?(team_expectation), "Couldn't find #{team_expectation.inspect}"
end
