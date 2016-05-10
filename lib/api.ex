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
  创建设备

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|
  |name|string|名字|
  |data_stream_frequency|int|数据流更新频率|
  |status_stream_frequency|int|状态流更新频率|
  |configs|string=>string|设备配置|
  |metrics|long|支持的采集类型集合|
  |enabled|boolean|是否可用|

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
  |403|非法域访问|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec create(Caller.t, uuid, String.t, non_neg_integer, non_neg_integer, %{String.t => String.t}, non_neg_integer, boolean) :: :ok | {:error, code, reason}
  def create(caller, did, name, data_stream_frequency, status_stream_frequency, configs, metrics, enabled \\ true) do
    remote_call(:create, [caller, did, name, data_stream_frequency, status_stream_frequency, configs, metrics, enabled])
  end

  @doc """
  删除设备

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
  |403|非法域访问|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec delete(Caller.t, uuid) :: :ok | {:error, code, reason}
  def delete(caller, did) do
    remote_call(:delete, [caller, did])
  end

  @doc """
  添加设备下面的控制器

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|
  |no|integer|设备编号|

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
  |403|非法域访问|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec add_controller(Caller.t, uuid, non_neg_integer) :: :ok | {:error, code, reason}
  def add_controller(caller, did, no) do
    remote_call(:add_controller, [caller, did, no])
  end

  @doc """
  删除设备下面的控制器

  ## 参数
  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|
  |no|integer|设备编号|

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
  |403|非法域访问|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec remove_controller(Caller.t, uuid, non_neg_integer) :: :ok | {:error, code, reason}
  def remove_controller(caller, did, no) do
    remote_call(:remove_controller, [caller, did, no])
  end

  @doc """
  获得设备列表。

  ## 参数

  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |enabled|boolean|列出有效的或无效的设备|
  |offset|integer|结果集游标偏离量|
  |limit|integer|结果集大小|

  ## 结果

  ### 成功

  ```elixir
  {:ok, [Entity.t]}
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec list(Caller.t, boolean, non_neg_integer, non_neg_integer) :: {:ok, [Entity.t]} | {:error, code, reason}
  def list(caller, enabled, offset, limit \\ 20) do
    remote_call(:list, [caller, enabled, offset, limit])
  end

  @doc """
  获得设备详情。

  ## 参数

  |arg|type|meaning|
  |---|----|-------|
  |caller|Caller|调用者|
  |did|uuid|设备 ID|

  ## 结果

  ### 成功

  ```elixir
  {:ok, Entity.t}
  ```

  ### 失败

  ```elixir
  {:error, code, reason}
  ```

  |code|reason|
  |----|------|
  |403|非法域访问|
  |404|设备不存在|
  |500|服务内部错误|

  since: 0.1.0

  """
  @spec get(Caller.t, uuid) :: {:ok, Entity.t} | {:error, code, reason}
  def get(caller, did) do
    remote_call(:get, [caller, did])
  end

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
  |403|非法域访问|
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
  |403|非法域访问|
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
