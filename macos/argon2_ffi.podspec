#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint argon2_ffi.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'argon2_ffi'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  #s.source_files     = 'Classes/**/*', '../ios/Classes/**/*.{m,c}', '../ios/Classes/argon2_ffi.c'
  #s.source_files     = 'Classes/**/*.{swift,m,c}'
  s.source_files = 'Classes/*.m', 'Classes/*.{swift,h,m,c}', 'Classes/argon2src/**/*.c'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '26.0'
  # hp_argon2_hash must be exported from the framework: Dart finds it by name (DynamicLibrary.process() or the framework).
  # A2_VISCTL makes ARGON2_PUBLIC an explicit default-visibility attribute; GCC_SYMBOLS_PRIVATE_EXTERN=NO keeps the default
  # for everything else. Apple Silicon only.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) A2_VISCTL=1',
    'GCC_SYMBOLS_PRIVATE_EXTERN' => 'NO',
    'EXCLUDED_ARCHS[sdk=macosx*]' => 'x86_64'
  }
  s.swift_version = '5.0'
end
