Pod::Spec.new do |s|

  s.name         = "MZInsetLabel"
  s.version      = "0.5.0"
  s.summary      = "MZInsetLabel is subClass of UILabel."
  s.description  = <<-DESC
                        MZInsetLabel is a sub class of UILabel that can be set insets.
                   DESC

  s.homepage     = "http://www.veryitman.com"
  s.license      = "MIT"
  s.author       = { "veryitman" => "veryitman@126.com" }
  s.platform     = :ios, "7.0"
  s.source = { :git => "https://github.com/veryitman/MZInsetLabel.git", :tag => "#{s.version}" }
  s.source_files  = "*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true

end
