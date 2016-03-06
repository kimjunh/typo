
# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end
Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create(article)
  end
end

Then /the merged article "(.*)" should have body "(.*)"/ do |id, body|
  Article.find_by_title(id).body.should == body
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


# Then /I should (not )?see movies with the ratings: (.*)/ do |not_see, rating_list|
#   ratings = rating_list.split(/\s*,\s*/)
#   ratings.each do |rating|
#     if not_see
#       step "I should not see /^#{rating}$/"
#     else
#       step "I should see /^#{rating}$/"
#     end
#   end
  
# end 


# # Make it easier to express checking or unchecking several boxes at once
# #  "When I uncheck the following ratings: PG, G, R"
# #  "When I check the following ratings: G"

# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   # HINT: use String#split to split up the rating_list, then
#   #   iterate over the ratings and reuse the "When I check..." or
#   #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   ratings = rating_list.split(/\s*,\s*/)
#   ratings.each do |rating|
#     rating_checkbox = "ratings_" + rating
#     if uncheck
#       step "I uncheck \"#{rating_checkbox}\""
#     else
#       step "I check \"#{rating_checkbox}\""
#     end
#   end
# end

# Then /I should see all the movies/ do
#   # Make sure that all the movies in the app are visible in the table
#   num_rows = Movie.count
#   (page.all('table#movies tr').count-1).should == num_rows
# end

# Then /^the director of "(.*)" should be "(.*)"$/ do |movie_name, director_name|
#   director_name.should == Movie.where(title: movie_name).first.director
# end
    