# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'ChatApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ChatApp
  pod 'SnapKit', '~> 5.0.0'
  pod 'Firebase/Analytics', '~> 7.4.0'
  pod 'Firebase/Auth', '~> 7.4.0'
  pod 'Firebase/Firestore', '~> 7.4.0'
  pod 'Firebase/Messaging', '~> 7.4.0'

  target 'ChatAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChatAppUITests' do
    # Pods for testing
  end
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end