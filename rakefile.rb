task :default do
  sh "rspec spec/ai_spec.rb"
  sh "rspec spec/board_spec.rb"
  sh "rspec spec/game_spec.rb"
  sh "rspec spec/player_spec.rb"
  sh "rspec spec/rules_spec.rb"
end
