Pod::Spec.new do |s|  
  s.name             = "ZWNetUtils"  
  s.version          = "1.0.9"  
  s.summary          = "A Common Net Utils used on iOS."  
  s.description      = <<-DESCRIPTION  
                       It is a common net utils used on iOS, which implement by Objective-C.
		       这是一个基于整个iOS项目的实用工具类，集合了很多第三方应用以及针对它的一些更加方便的封装，另外也有搜集一些简单实用的一些小型控件。笔者立志将其打造成一个在搭建一个新项目时首选的项目基础框架。该项目会持续更新和封装更多优秀的工具。
                         DESCRIPTION
  s.homepage         = "https://github.com/wanney/ZWNetUtils"  
  s.license          = 'MIT'  
  s.author           = { "王林" => "wanney216@gmail.com" }  
  s.source           = { :git => "https://github.com/wanney/ZWNetUtils.git", :tag => s.version.to_s }  
  
  s.platform     = :ios, '8.0'  
  s.requires_arc = true  
  s.source_files = 'ZWNetUtilsDemo/ZWNetUtilsDemo/ZWNetUtils/**/*.{h,m}'  
  s.resources    = ['ZWNetUtilsDemo/ZWNetUtilsDemo/ZWNetUtils/**/*.{xib,storyboard}']

  s.frameworks   = 'Foundation', 'CoreLocation', 'UIKit'
  
  s.dependency 'IQKeyboardManager', '~> 4.0.0'
  s.dependency 'AFNetworking', '~> 2.0'
  s.dependency 'MBProgressHUD', '~> 0.9.2'
  s.dependency 'MJRefresh', '~> 3.1.0'
  s.dependency 'SDWebImage', '~> 3.7.5'
  s.dependency 'JZNavigationExtension', '~> 1.4.7'   
 
  s.dependency 'ZLPhotoBrowser', '~> 1.0.5'
#弹出视图
  s.dependency 'WYPopoverController', '~> 0.2.2'
end
