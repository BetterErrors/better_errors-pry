require "spec_helper"

describe BetterErrors do
  describe '#use_pry!' do
    it 'sets REPL::Pry as the repl provider' do
      a = expect { BetterErrors.use_pry! }.to change { BetterErrors::REPL.provider }
        .to(BetterErrors::REPL::Pry)
    end
  end
end
