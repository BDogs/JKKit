
Pod::Spec.new do |s|

  s.name         = "JKKit"
  s.version      = "1.0.0"
  s.summary      = "北京金凯瑞铭信息技术有限公司-无锡分公司-IOS框架"
  s.homepage     = "http://jksoft.cn/"
  s.license      = "Apache License, Version 2.0"
  s.author       = "北京金凯瑞铭信息技术有限公司-无锡分公司-傅涛"
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/JKKit.git'}
  s.public_header_files   = 'Pod/Classes/JKKit.h'
  s.source_files          = 'Pod/Classes/JKKit.h'

  s.frameworks  = "UIKit","Foundation"

  s.default_subspec = 'Category','HTTP','Model','ViewModel'

  s.subspec 'Category' do |sp|
    sp.source_files = 'Pod/Classes/Core/Category/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/Category/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
       pch_JKKitCategory = <<-EOS
#ifndef USE_JKKIT_CATEGORY
  #define USE_JKKIT_CATEGORY 1
#endif
EOS
  end
  s.subspec 'HTTP' do |sp|
    sp.source_files = 'Pod/Classes/Core/HTTP/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/HTTP/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'AFNetworking'
    pch_JKKitHTTP = <<-EOS
#ifndef USE_JKKIT_HTTP
  #define USE_JKKIT_HTTP 1
#endif
  end

  s.subspec 'Model' do |sp|
    sp.source_files = 'Pod/Classes/Core/Model/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/Model/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'JSONModel'
    pch_JKKitModel = <<-EOS
#ifndef USE_JKKIT_MODEL
  #define USE_JKKIT_MODEL 1
#endif
  end

  s.subspec 'ViewModel' do |sp|
    sp.source_files = 'Pod/Classes/Core/ViewModel/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/ViewModel/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'JKKit/HTTP'
    sp.dependency 'JKKit/Model'
    pch_JKKitViewModel = <<-EOS
#ifndef USE_JKKIT_VIEWMODEL
  #define USE_JKKIT_VIEWMODEL 1
#endif
  end

  s.subspec 'Plugins' do |sp|
    sp.source_files = 'Pod/Classes/Plugins/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Plugins/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    pch_JKKitViewPlugins = <<-EOS
#ifndef USE_JKKIT_PLUGINS
  #define USE_JKKIT_PLUGINS 1
#endif
  end

end