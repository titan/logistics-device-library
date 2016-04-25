# device-library

访问设备微服务的库

## Installation

  1. 在 `mix.exs` 的依赖中添加 `device-library`

        def deps do
          [{:device_library, git: "git@gitlab.ruicloud.cn:ruicloud-triot/device-library.git", tag: "0.1.0" }]
        end

  2. 确认 `device-library` 在应用前启动:

        def application do
          [applications: [:device_library]]
        end
