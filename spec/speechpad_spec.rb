require 'helper'

describe Speechpad do
  describe ".new" do
    it "should be a new Speechpad::Client" do
      Speechpad.new.should be_a Speechpad::Client
    end
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      Speechpad.respond_to?(:new, true).should be_true
    end
  end
end
