# -*- coding: utf-8 -*-
# Copyright (c) 2009-2013 VMware, Inc.

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))
require 'api/message'

module VCAP
  module Services
  end
end

module VCAP::Services::Internal
  # Provisioner --> Node
  class ProvisionRequest < ServiceMessage
    required :plan, String
    optional :credentials
    optional :version
    optional :properties, Hash
  end

  # Node --> Provisioner
  class ProvisionResponse < ServiceMessage
    required :success
    optional :credentials
    optional :error
  end

  class UnprovisionRequest < ServiceMessage
    required :name, String
    required :bindings, [Hash]
  end

  class BindRequest < ServiceMessage
    required :name, String
    optional :bind_opts, Hash
    optional :credentials
  end

  class BindResponse < ServiceMessage
    required :success
    optional :credentials
    optional :error
  end

  class UnbindRequest < ServiceMessage
    required :credentials
  end

  class SimpleResponse < ServiceMessage
    required :success
    optional :error
  end

  class RestoreRequest < ServiceMessage
    required :instance_id
    required :backup_path
  end

  class NodeHandlesReport < ServiceMessage
    required :instances_list
    required :bindings_list
    required :node_id
  end

  class PurgeOrphanRequest < ServiceMessage
    # A list of orphan instances names
    required :orphan_ins_list
    # A list of orphan bindings credentials
    required :orphan_binding_list
  end

  class ServiceHandle < ServiceMessage
    required :service_id,     String
    required :configuration,  Hash
    required :credentials,    Hash
    optional :dashboard_url,  String
  end

  class ServiceInstanceHandleV2 < ServiceMessage
    required :gateway_data,         Hash
    required :credentials,          Hash
    optional :name,                 String
    optional :service_plan_guid,    String
    optional :space_guid,           String
    optional :service_bindings_url, String
    optional :space_url,            String
    optional :service_plan_url,     String
    optional :dashboard_url,        String
  end

  class ServiceBindingHandleV2 < ServiceMessage
    required :credentials,           Hash
    required :gateway_data,          Hash
    required :gateway_name,          String
    optional :app_guid,              String
    optional :service_instance_guid, String
    optional :binding_options,       Hash
    optional :app_url,               String
    optional :service_instance_url,  String
  end

  class InstanceHealthOK < ServiceMessage
    required :instance_id,          String
    required :heartbeat_time,       String
  end

  class BackupJobResponse < ServiceMessage
    required :success
    required :properties,           Hash
    optional :error
  end

  class ServiceRecipes < ServiceMessage
    required :credentials,      Hash
    required :configuration do
      {
        "peers" => [
          {
            "credentials" => {
              "node_id" => String
            }
          }
        ]
      }
    end
  end

  # SC -> Provisioner -> Node
  class PerformOperationRequest < ServiceMessage
    required :args,      Hash
  end

  # Node -> Provisioner -> SC
  class PerformOperationResponse < ServiceMessage
    required :result
    required :code,       String
    required :properties, Hash
    required :body,       Hash
  end

  # SC -> Provisioner
  class GatewayProvisionRequest < ServiceMessage
    required :unique_id, String
    required :name,      String
    optional :email,     String

    optional :provider,          String
    optional :label,             String
    optional :plan,              String
    optional :version,           String
    optional :properties,        Hash
  end

  # Provisioner -> SC
  class GatewayProvisionResponse < ServiceMessage
    required :service_id, String
    required :configuration
    required :credentials
    optional :status
  end
end
