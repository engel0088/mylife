require "spec_helper"

describe CheckItem do
  before{
     @check_item=CheckItem.new
  }
  subject { @check_item }

  it "should have appropriate properties" do
     should respond_to(:rate)
     should respond_to(:text)
     should respond_to(:publicity)
     should respond_to(:max_star_count)
     should respond_to(:priority)
     should respond_to(:star_resource_url)
     should respond_to(:id)
     should respond_to(:created_at)
     should respond_to(:check_date)
  end

end
