defmodule Device.Entity do
  defstruct did: nil, name: nil, fireware: nil, config: nil, enabled: true
  @type t :: %Device.Entity{did: String.t, name: String.t, fireware: String.t, config: String.t, enabled: boolean}
end
