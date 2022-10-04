#
# Be sure to run `pod lib lint LYLoading.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYLoading'
  s.version          = '0.1.0'
  s.summary          = 'use for show loading'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
use for show loading, welcome to use.
                       DESC

  s.homepage         = 'https://github.com/liangqicai-gitHub/LYLoading'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sunny' => '2468751795@qq.com' }
  s.source           = { :git => 'https://github.com/liangqicai-gitHub/LYLoading.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

#  https://www.jianshu.com/p/d6b86c900dce
#  // 使用resources的情况：
#  let myBundle = Bundle(for: TestTableViewCell.self)
#  tableView.register(UINib.init(nibName: "TestTableViewCell", bundle: myBundle),
#                     forCellReuseIdentifier: "cell")
#
#  // 使用resource_bundles的情况：
#  let myBundle = Bundle(for: TestTableViewCell.self)
#  let path = myBundle.path(forResource: "AssetsDemo", ofType: "bundle")!
#  let assetsBundle = Bundle.init(path: path)
#  tableView.register(UINib.init(nibName: "TestTableViewCell", bundle: assetsBundle),
#                     forCellReuseIdentifier: "cell")

  s.source_files = 'LYLoading/Classes/**/*.swift'
  s.resource_bundles = {
      'LYLoading' => ['LYLoading/{Assets,Classes}/**/*.{xcassets,png,xib}']
  }

  # s.resource_bundles = {
  #   'LYLoading' => ['LYLoading/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'SnapKit', '5.6.0'
  s.swift_versions = [5.0]
end
