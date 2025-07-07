# frozen_string_literal: true

RSpec.shared_context "with telegram context" do
  let(:from) { { "id" => 123 } }
  let(:chat) { { "id" => 456 } }
  let(:controller) do
    described_class.new(bot, from: from, chat: chat)
  end
end
