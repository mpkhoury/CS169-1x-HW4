Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |film, director|
  Movie.where(title: film).first.director.should == director
end

Given /^I am on the details page for "(.*?)"$/ do |film|
  
end

When /^I follow "Find Movies With Same Director"$/ do
  
end


Then /^I should be on the Similar Movies page for "(.*?)"$/ do |film|
    current_path = URI.parse(current_url)
    if current_path.respond_to? :should
      assert page.current_path == similar_movie_path(1)
    end
end

#### TEST ####

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
  body = page.html
  assert body.index(e1) < body.index(e2)
end

Then /^(?:|I )should see all of the movies/ do
  #assert(false, page.html)
  #assert find("tbody").find("tr").should == Movie.count
  #if page.respond_to? :should
  #  assert page.should have_xpath('//tbody/tr', :count => Movie.count)
  #else
  #  assert page.has_xpath('//tbody/tr', :count => Movie.count)
  #end
  Movie.find(:all).each do |movie|
    title = movie["title"]
    if page.respond_to? :should
      page.should have_content(title)
    else
      assert page.has_content?(title)
    end
  end
end
  
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #puts uncheck
  rating_list.split(',').each do |rating|
    #flunk uncheck
    if uncheck
      #When %{I fill in "#{name}" with "#{value}"}
      #When /^(?:|I )check "([^"]*)"$/ do |field|
      uncheck("ratings_#{rating}")
      #end
    else
      check("ratings_#{rating}")
    end
  end
end

