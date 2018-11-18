Pod::Spec.new do |spec|
  spec.name             = "ZhuiShuPod"
  spec.version          = "1.0.0"
  spec.summary          = "追书神器换源,去广告等"
  spec.description      = <<-DESC
                          - 追书神器换源,去广告,去掉多余弹窗
                        DESC

  spec.homepage         = "https://github.com/lixianshen/ZhuiShuPod"

  spec.license          = { :type => "BSD", :file => "LICENSE" }
  spec.author           = { "LiChengFu" => "lichengfu575@gmail.com" }
  spec.platform         = :ios, "8.0"
  spec.source           = { :git => "https://github.com/lixianshen/ZhuiShuPod.git", :tag => spec.version.to_s }
  spec.source_files     = "ZhuiShuPod/ZhuiShuPod/**/*.{h,m}"
  spec.public_header_files = "ZhuiShuPod/ZhuiShuPod/ZhuiShuPod.h"
  spec.requires_arc     = true
  spec.pod_target_xcconfig = { "ONLY_ACTIVE_ARCH" => "NO", "HEADER_SEARCH_PATHS" => "/opt/MonkeyDev/include" }          #这个必须有，不要修改
end
