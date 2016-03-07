
# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create(article)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create(comment)
  end
end

Then /the merged article "(.*)" should have body "(.*)"/ do |id, body|
  Article.find_by_title(id).body.should == body
end

Then /the comment "(.*)" should point to the article "(.*)"/ do |comment, article_title|
  Comment.find_by_body(comment).article_id.should == Article.find_by_title(article_title).id
end

Given /^I am logged into the admin panel as "(.*)"$/ do |username|
  visit '/accounts/login'
  fill_in 'user_login', :with => username
  fill_in 'user_password', :with => "password"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

