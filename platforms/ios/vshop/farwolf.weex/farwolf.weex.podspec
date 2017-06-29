

Pod::Spec.new do |s|

 

  s.name         = "farwolf.weex"
  s.version      = "0.0.1"
  s.summary      = "Handle some data."
  s.description  = <<-DESC
                    Handle the data.
                   DESC

  s.homepage     = "http://csdn.net/veryitman"
  s.license      = "MIT"
  s.author             = { "veryitman" => "veryitman@126.com" }
  s.source =  { :path => '.' }
  s.source_files  = "Source", "farwolf.weex/**/*.{h,m,mm,c}"
  s.exclude_files = "Source/Exclude"
  s.resources = 'farwolf.weex/resources/storyboard/**','farwolf.weex/resources/image/**','farwolf.weex/resources/xib/**'
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  

  s.dependency 'farwolf'
  s.dependency 'WeexSDK'
  s.dependency 'SDWebImage', '~> 3.8'
  s.dependency 'WXDevtool',  '~> 0.9.5'
  s.dependency 'Masonry', '~> 0.6.3'

end
