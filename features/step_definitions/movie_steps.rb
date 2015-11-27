Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #fail "Unimplemented"
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |film, director|
  
end

Given /^I am on the details page for "(.*?)"$/ do |film|
  
end

When /^I follow "Find Movies With Same Director"$/ do
  
end

Then /^I should be on the (.*?) page for "(.*?)"$/ do |page_name, film|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
end