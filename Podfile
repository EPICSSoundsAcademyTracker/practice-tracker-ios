use_frameworks!

platform :ios, '10.0'

target 'Waves' do
pod 'Beethoven'
pod 'Hue', git: 'https://github.com/hyperoslo/Hue'
pod 'Cartography'
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end
