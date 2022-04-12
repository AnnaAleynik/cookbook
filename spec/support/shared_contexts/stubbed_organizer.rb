RSpec.shared_context :stubbed_organizer do |options|
  options ||= {}
  let(:organizer) { described_class.new(organizer_context) }
  let(:context) { organizer.context }
  let(:interactor) { organizer }

  before do
    allow(described_class).to receive(:organized) { [] }
    options[:disabled_hooks].to_a.each do |hook|
      allow(described_class).to receive(hook) { [] }
    end
    allow(organizer).to receive(:context).and_call_original
    allow(organizer).to(receive(:run!).and_raise(Interactor::Failure)) if options[:failure]
  end
end
