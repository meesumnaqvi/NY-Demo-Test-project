# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NY Times Artical Demo Project' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'Alamofire'
pod 'RealmSwift', '~>10'
pod 'CombineExt'
pod 'CombineDataSources'
pod 'CombineCocoa'
pod 'netfox'
pod 'SwiftLoader'
pod 'IQKeyboardManagerSwift'

  # Pods for NY Times Artical Demo Project

  target 'NY Times Artical Demo ProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NY Times Artical Demo ProjectUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.2'
            end
        end
    end
end
