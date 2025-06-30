# frozen_string_literal: true

require "rails_helper"

shared_examples_for "RecurrenceBuildable" do
  let(:model) { described_class }
  let(:obj) { create(model.to_s.downcase.to_sym, starts_at: 1.hour.from_now) }

  it { is_expected.to allow_value("daily").for(:recurring_type) }
  it { is_expected.to allow_value("weekly").for(:recurring_type) }
  it { is_expected.to allow_value("biweekly").for(:recurring_type) }
  it { is_expected.to allow_value("monthly").for(:recurring_type) }
  it { is_expected.to allow_value(nil).for(:recurring_type) }
  it { is_expected.not_to allow_value("not_supported").for(:recurring_type) }

  it do
    pending "not validated yet"
    expect(subject).not_to allow_value("foo").for(:recurring_until)
  end

  it "saves recurring_rule as JSON" do
    obj.recurring_type = "daily"
    obj.save!
    recurring_rule = model.find_by(id: obj.id).recurring_rule

    expect { JSON.parse(recurring_rule) }.not_to raise_error
  end
end
