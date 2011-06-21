# -*- encoding: utf-8 -*-
require 'helper'

describe EPA do
  describe ".client" do
    it "should be a EPA::Client" do
      EPA.client.should be_a EPA::Client
    end
  end
end
