RSpec.shared_context :stubbed_interactor do |options|
  include_context :interactor

  options ||= {}

  before do
    allow(interactor).to receive(:call) { nil }
    options[:disabled_hooks].to_a.each do |hook|
      allow(described_class).to receive(hook) { [] }
    end
    allow(interactor).to receive(:context).and_call_original
    allow(interactor).to(receive(:run!).and_raise(Interactor::Failure)) if options[:failure]
  end
end
