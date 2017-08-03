require "better_errors/pry/version"
require "better_errors"
require "better_errors/repl/pry"

module BetterErrors
  def self.use_pry!
    BetterErrors::REPL.provider = BetterErrors::REPL::Pry
  end
end
