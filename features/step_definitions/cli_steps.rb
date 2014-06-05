Then(/^the output should contain the current version$/) do
  assert_partial_output(Dystio::VERSION, all_output)
end
