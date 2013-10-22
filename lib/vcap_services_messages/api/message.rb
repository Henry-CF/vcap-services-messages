# -*- coding: utf-8 -*-
# Copyright (c) 2009-2013 VMware, Inc.

require 'json_message'

class ServiceMessage < JsonMessage

  def set_field(field, value)
    f = self.class.fields[field.to_sym]
    if value.nil? && f && f.required == false
      @msg.delete(field)
    else
      super(field, value)
    end
  end

  # Return a deep copy of @msg
  def dup
    @msg.deep_dup
  end

  def inspect
    @msg.inspect
  end
end
