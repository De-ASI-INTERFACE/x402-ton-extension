import Lake
open Lake DSL
package «x402-ton» where
  name := "x402-ton"
require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"
lean_lib «X402TON» where
  roots := #[`X402TON]
