defmodule Device.Api do
  alias Device.Entity
  alias Domain.Caller

  @typedoc """
  Integer 类型的错误状态编码
  """
  @type code :: integer

  @typedoc """
  错误发生的原因
  """
  @type reason :: String.t

  @typedoc """
  UUID 的 String 表达

  ## 例子
  ```elixir
  "60c0b63f-99f0-5fb1-9f34-46a86acd37fa"
  ```
  """
  @type uuid :: String.t

  @doc """
  启用设备。在修改设备状态的同时，更新设备信息到 Service

  ## 参数

  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec enable(Caller.t, uuid) :: :ok | {:error, code, reason}
  def enable(caller, did) do
    remote_call(:enable, [caller, did])
  end

  @doc """
  禁用设备。在修改设备状态的同时，更新设备信息到 Service

  ## 参数

  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|

  ## 结果

  ### 成功

  ```elixir
  :ok
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec disable(Caller.t, uuid) :: :ok | {:error, code, reason}
  def disable(caller, did) do
    remote_call(:disable, [caller, did])
  end

  @spec remote_call(atom, [integer | String.t]) :: :ok | {:ok, Entity.t} | {:ok, [Entity.t]} | {:error, code, reason}
  defp remote_call(cmd, args) when is_atom(cmd) and is_list(args) do
    :resource_discovery.rpc_call(:device_service, Device.Service, cmd, args)
  end
end
