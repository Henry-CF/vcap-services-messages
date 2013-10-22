$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'vcap_services_messages/version'

Gem::Specification.new do |s|
  s.name         = 'vcap_services_messages'
  s.version      = VCAP::Services::Messages::VERSION
  s.platform     = Gem::Platform::RUBY
  s.summary      = 'VCAP services messages module'
  s.description  = 'Message protocol for building CF services components'
  s.homepage     = 'https://github.com/vchs/vcap-services-messages'
  s.files        = Dir.glob('lib/**/*')
  s.require_path = [ 'lib' ]
  s.author       = 'vCHS Application Services Team'
  s.email        = 'cn-vchs-svc@googlegroups.com'

  s.add_dependency 'json'
  s.add_dependency 'vcap_common', '>= 2.2.1'
end
