require "spec_helper"

RSpec.describe BetterErrors::ErrorPage do
  let(:exception) { empty_binding.eval("raise") rescue $! }

  let(:error_page) { described_class.new exception, { "PATH_INFO" => "/some/path" } }

  let(:response) { error_page.render }

  let(:empty_binding) {
    local_a = :value_for_local_a
    local_b = :value_for_local_b

    @inst_c = :value_for_inst_c
    @inst_d = :value_for_inst_d

    binding
  }

  before(:all) do
    BetterErrors.use_pry!
  end

  describe '#do_eval' do
    let(:exception) { empty_binding.eval("raise") rescue $! }
    subject(:do_eval) { error_page.do_eval("index" => 0, "source" => command) }
    let(:command) { 'EvalTester.stuff_was_done(:yep)' }
    before do
      stub_const('EvalTester', eval_tester)
    end
    let(:eval_tester) { double('EvalTester', stuff_was_done: 'response') }

    context 'with Pry enabled' do
      it "evaluates the code" do
        BetterErrors::REPL.provider
        do_eval
        expect(eval_tester).to have_received(:stuff_was_done).with(:yep)
      end

      it 'returns a hash of the code and its result' do
        expect(do_eval).to include(
          highlighted_input: /stuff_was_done/,
          prefilled_input: '',
          prompt: '[2] pry(#<RSpec::ExampleGroups::BetterErrorsErrorPage::DoEval::WithPryEnabled>):1> ',
          result: "=> \"response\"\n",
        )
      end
    end
  end
end
