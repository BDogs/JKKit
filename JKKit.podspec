#
# Be sure to run `pod lib lint JKKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name         = "JKKit"
  s.version      = "1.0.6"
  s.summary      = "北京金凯瑞铭信息技术有限公司-无锡分公司-IOS框架"
  s.homepage     = "http://jksoft.cn/"
  s.license      = "Apache License, Version 2.0"
  s.author       = "北京金凯瑞铭信息技术有限公司-无锡分公司-傅涛"
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/JKKit.git', :tag => s.version.to_s }

  s.frameworks  = "UIKit","Foundation"
  s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <Foundation/Foundation.h>'

  s.source_files = 'Pod/Classes/*.{h,m}'
  s.public_header_files   = 'Pod/Classes/*.{h}'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Pod/Classes/Core/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Core/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'AFNetworking'
    sp.dependency 'JSONModel'
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_CORE=1' }
  end

  s.subspec 'Plugins' do |sp|
    sp.source_files = 'Pod/Classes/Plugins/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Plugins/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_PLUGINS=1' }
  end

  s.subspec 'Caches' do |sp|
    sp.source_files = 'Pod/Classes/Caches/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Caches/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_CACHES=1' }
  end

  s.subspec 'Refresh' do |sp|
    sp.source_files = 'Pod/Classes/Refresh/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Refresh/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'MJRefresh'
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_REFRESH=1' }
  end

    s.subspec 'HUD' do |sp|
    sp.source_files = 'Pod/Classes/HUD/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/HUD/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.dependency 'MBProgressHUD'
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_HUD=1' }
  end

    s.subspec 'Validator' do |sp|
    sp.source_files = 'Pod/Classes/Validator/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Validator/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_VALIDATOR=1' }
  end

    s.subspec 'Security' do |sp|
    sp.source_files = 'Pod/Classes/Security/**/*.{h,m}'
    sp.public_header_files   = 'Pod/Classes/Security/**/*.{h}'
    sp.frameworks            = "UIKit","Foundation"
    sp.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_JKKIT_SECURITY=1' }
  end

end