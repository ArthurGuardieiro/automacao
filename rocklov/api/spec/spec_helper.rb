require_relative "routes/signup"
require_relative "routes/sessions"
require_relative "routes/equipos"

require_relative "libs/mongo"
require_relative "helpers"

require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    users = [
      { name: "Roberto Carlos", email: "betao@yahoo.com", password: to_md5("pwd123") },
      { name: "Penelope", email: "penelope@gmail.com", password: to_md5("pwd123") },
      { name: "Edward Newgate", email: "ed@gmail.com", password: to_md5("pwd123") },
      { name: "Joe", email: "joe@gmail.com", password: to_md5("pwd123") },
    ]

    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end
end
