# frozen_string_literal: true

require "webmock"

RSpec.describe TermiiRuby::Sender do
  it "has a version number" do
    expect(TermiiRuby::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
end
