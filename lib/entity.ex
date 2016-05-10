defmodule Device.Entity do
  defstruct did: nil, name: nil, firmware: nil, data_stream_frequency: 0, status_stream_frequency: 0, config: nil, enabled: true, controllers: []
  @type t :: %Device.Entity{did: String.t, name: String.t, firmware: String.t, data_stream_frequency: non_neg_integer, status_stream_frequency: non_neg_integer, config: String.t, enabled: boolean, controllers: [non_neg_integer]}
end
