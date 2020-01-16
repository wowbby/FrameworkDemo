
@version = "0.1.0"
@podName = "FrameworkDemo"
@baseURL = "github.com"
@basePath = "wowbby/#{@podName}"
@source_files = "#{@podName}/Classes/**/*"
@frameworkName = "#{@podName}"
Pod::Spec.new do |s|
  s.name          = "#{@podName}"
  s.version       = @version
  s.summary       = "设置描述"
  s.homepage      = "https://#{@baseURL}/#{@basePath}"
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { "wowbby" => "zhengzhenxing3@jd.com" }
  s.platform      = :ios, '8.0'
  s.source        = { :git => "#{s.homepage}.git", :tag => "#{s.version}" }
  s.subspec 'Source' do |source|
    source.source_files = @source_files
  end
  s.subspec 'Framework' do |framework|
    framework.vendored_frameworks = "Carthage/build/iOS/#{@frameworkName}.framework"
  end
  s.prepare_command =  <<-CMD
  touch Cartfile
  echo 'git "git@#{@baseURL}:#{@basePath}.git" == #{@version}' > Cartfile
  Carthage update --platform iOS
  CMD
end
