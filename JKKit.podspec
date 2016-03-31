
Pod::Spec.new do |s|

  s.name         = "JKKit"
  s.version      = "1.0.2"
  s.summary      = "北京金凯瑞铭信息技术有限公司-无锡分公司-IOS框架"
  s.homepage     = "http://jksoft.cn/"
  s.license      = "Apache License, Version 2.0"
  s.author       = "北京金凯瑞铭信息技术有限公司-无锡分公司-傅涛"
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/JKKit.git'}

  s.frameworks  = "UIKit","Foundation"
  s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <Foundation/Foundation.h>'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Pod/Classes/Core/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'AFNetworking'
    sp.dependency 'JSONModel'
  end

  s.subspec 'Plugins' do |sp|
    sp.source_files = 'Pod/Classes/Plugins/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Plugins/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
  end

end