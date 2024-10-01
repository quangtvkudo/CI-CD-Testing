# Uncomment the next line to define a global platform for your project
# platform :ios, '16.0'

target 'LearningRxSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire'
  pod 'RMQClient'
  pod 'AZSClient'
  pod 'AlertToast'
  pod 'Files'
  pod 'SKPhotoBrowser'
  pod 'RealmSwift'
  pod 'Sentry'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
    end
  end

  file = 'Pods/Target Support Files/Pods-LearningRxSwift/Pods-LearningRxSwift-frameworks.sh'

  if File.exist?(file)
    content = File.read(file)
    if !content.include?('source="$(readlink -f "${source}")"')
      fixed_content = content.gsub('source="$(readlink "${source}")"', 'source="$(readlink -f "${source}")"')
      File.write(file, fixed_content)
    else
    end
  else
  end
end
