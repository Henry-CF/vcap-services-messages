$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'common/enum'

module VCAP
  module Services
  end
end

module VCAP::Services::Internal

  # Service-Instance id
  SERVICE_ID = "service_id"

  #Restoring a backup
  class ProvisionArguments < Enum
    enum_with_value_for :username, "username"
    enum_with_value_for :password, "password"

    enum_with_value_for :backup_id, "backup_id"
    enum_with_value_for :restore_from_url, "restore_from_url"
  end

  # BACKUP-specific constants
  class BackupProperties < Enum
    enum_with_value_for :backup_id, "backup_id"
    enum_with_value_for :update_url, "update_url"
    enum_with_value_for :status, "status"
    enum_with_value_for :backup_url, "backup_url"
  end


  # Possible values in status field in service_instance
  class ServiceInstanceStatus < Enum
    enum_for :creating
    enum_for :restoring
    enum_for :ready
    enum_for :failure
  end
end