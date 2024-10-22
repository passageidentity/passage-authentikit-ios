Pod::Spec.new do |s|
  s.name             = 'Authentikit'
  s.version          = ENV['LIB_VERSION'] || '0.1.0'
  s.summary          = "Are your users Passkey Ready? Find out for sure with Passage by 1Password and Authentikit for Apple platforms."
  s.description      = <<-DESC
Are your users Passkey Ready? Find out for sure with Passage by 1Password and Authentikit for Apple platforms.
                       DESC
  s.homepage         = 'http://docs.passage.id/passkey-ready'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Passage by 1Password' => 'support@passage.id' }
  s.source           = { :git => 'https://github.com/passageidentity/passage-authentikit-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Authentikit/**/*'
end
