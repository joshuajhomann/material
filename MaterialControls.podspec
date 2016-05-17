Pod::Spec.new do |s|
  s.name             = "MaterialControls"
  s.version          = "1.1.0"
  s.summary          = "Material Design controls for iOS writen in Objective-C."

  s.homepage         = "https://github.com/fpt-software/Material-Controls-For-iOS"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "FPT Software" => "mobility@fsoft.com.vn" }
  s.source           = { :git => "https://github.com/fpt-software/Material-Controls-For-iOS.git", :tag => "1.1.0" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'iOSUILib/iOSUILib/**/*'
  s.resource_bundles = {
    'MaterialControls' => ['iOSUILib/iOSUILib/*.png']
  }
end
