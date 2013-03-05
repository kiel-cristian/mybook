RSpec.configure do |config|
  config.use_transactional_fixtures = false

  #this config makes the login test with selenium works, but doesn't with webkit
  DatabaseCleaner.strategy = :transaction

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end