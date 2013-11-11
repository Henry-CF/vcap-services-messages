require 'spec_helper'
require 'vcap_services_messages/api/message'

describe "ServiceMessage" do
  let(:klass) do
    k = Class.new(ServiceMessage)
    k.required :name, String
    k.optional :tag, String
    k
  end

  it "ignore the unknown field" do
    expect do
      klass.new({:name => "test", :unknown => "unknown"})
    end.not_to raise_error
  end

  it "remove the optional field that has nil value" do
    msg = klass.new({:name => "test", :tag => nil})
    msg.encode !~ /tag/
  end
end

module VCAP::Services::Internal
  describe "ServiceRecipes" do
    it "should validate configuration section" do
      req = ServiceRecipes.new
      req.credentials = {}
      expect { req.configuration = [] }.to raise_error
      expect { req.configuration = {} }.to raise_error
      expect { req.configuration = {"peers" => []} }.to_not raise_error
      expect { req.configuration = {"peers" => [{}]} }.to raise_error
      expect { req.configuration = {"peers" => [ {"credentials" => {}} ]} }.to raise_error
      expect do
        req.configuration = {
          "peers" => [
            {
              "credentials" => {
                "node_id" => "node1",
                "host" => "localhost"
              }
            }
          ]
        }
      end.to_not raise_error
    end
  end
end
