# devicelib

访问设备微服务的库

## Installation

  1. 在 `mix.exs` 的依赖中添加 `devicelib`

        def deps do
          [{:devicelib, git: "git@gitlab.ruicloud.cn:titan/devicelib.git", tag: "0.1.0" }]
        end

  2. 确认 `devicelib` 在应用前启动:

        def application do
          [applications: [:devicelib]]
        end
