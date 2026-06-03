Pod::Spec.new do |spec|
  spec.name             = 'DonkeyLockKit'
  spec.version          = '1.4.3'
  spec.summary          = 'Donkey Republic BLE lock SDK for iOS.'
  spec.description      = <<~DESC
    DonkeyLockKit lets iOS apps interact with the BLE-enabled locks fitted on
    Donkey Republic vehicles. Ships as a prebuilt xcframework with no
    transitive dependencies.
  DESC
  spec.homepage         = 'https://github.com/DonkeyRepublic/lockkit-ios'
  spec.license          = 'MIT'
  spec.author           = { 'Donkey Republic' => 'support@donkey.bike' }
  spec.platform         = :ios, '13.0'
  spec.swift_version    = '5.9'
  spec.source           = {
    :git => 'https://github.com/DonkeyRepublic/lockkit-ios.git',
    :tag => "v#{spec.version}"
  }
  spec.vendored_frameworks = 'DonkeyLockKit.xcframework', 'LinkaAPIKit.xcframework'
end
