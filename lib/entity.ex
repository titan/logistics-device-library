defmodule Device.Entity do
  defstruct did: nil, name: nil, data_stream_frequency: 0, status_stream_frequency: 0, configs: nil, metrics: 0, enabled: true, controllers: []
  @type t :: %Device.Entity{did: String.t, name: String.t, data_stream_frequency: non_neg_integer, status_stream_frequency: non_neg_integer, configs: %{String.t => String.t}, metrics: non_neg_integer, enabled: boolean, controllers: [non_neg_integer]}
end
