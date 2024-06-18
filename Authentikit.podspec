Pod::Spec.new do |s|
  s.name             = 'Authentikit'
  s.version          = ENV['LIB_VERSION'] || '0.1.0'
  s.summary          = "Use Passage Authentikit to evaluate the passkey readiness of users' iOS device."
  s.homepage         = 'https://github.com/passageidentity/passage-authentikit-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Passage Identity, Inc' => 'hello@passage.id' }
  s.source           = { :git => 'https://github.com/passageidentity/passage-authentikit-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Authentikit/**/*'
end