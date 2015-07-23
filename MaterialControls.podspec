#
# Be sure to run `pod lib lint MaterialControls.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MaterialControls"
  s.version          = "0.1.0"
  s.summary          = "Material Design controls for iOS writen in Objective-C."
  s.description      = <<-DESC
                       Material Design controls for iOS writen in Objective-C. They are extended from default iOS controls to add material design UI.
                       DESC
  s.homepage         = "https://github.com/fpt-software/Material-Controls-For-iOS"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "FSB.FMC" => "fsb.fmc@fsoft.com.vn" }
  s.source           = { :git => "https://github.com/fpt-software/Material-Controls-For-iOS.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'iOSUILib/iOSUILib/**/*'
  s.resource_bundles = {
    'MaterialControls' => ['iOSUILib/iOSUILib/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
