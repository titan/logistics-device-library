defmodule Device.Entity do
  defstruct did: nil, name: nil, fireware: nil, config: nil, enabled: true, controllers: []
  @type t :: %Device.Entity{did: String.t, name: String.t, fireware: String.t, config: String.t, enabled: boolean, controllers: [non_neg_integer]}
end
