# -*- coding: utf-8 -*-
# Copyright (c) 2009-2013 VMware, Inc.

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'simplecov'
require 'simplecov-rcov'
require 'vcap_services_messages'

RSpec.configure do |config|
  config.include(VCAP::Services::Internal)
end
