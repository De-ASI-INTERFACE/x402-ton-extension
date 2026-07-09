-- ============================================================
-- x402-TON: DeDust v2 Routing Invariants
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- ============================================================
import Mathlib.Data.Nat.Basic
import X402TON.PaymentVerification

namespace X402TON.DeDust

structure Pool where
  asset0 : Nat; asset1 : Nat
  pool_type : Nat  -- 0=volatile, 1=stable
  deriving Repr

structure SwapStep where
  pool : Pool; amount_in : Nat; min_amount_out : Nat
  deriving Repr

structure GatedSwap where
  auth : PaymentAuth; step : SwapStep
  deriving Repr

def route_authorized (gs : GatedSwap) (s : FacilitatorState) : Prop := verify gs.auth s
def route_sane (gs : GatedSwap) : Prop := 0 < gs.step.min_amount_out ∧ gs.auth.amount = gs.step.amount_in
def gated_swap_valid (gs : GatedSwap) (s : FacilitatorState) : Prop := route_authorized gs s ∧ route_sane gs

theorem gated_swap_requires_payment (gs : GatedSwap) (s : FacilitatorState) (h : gated_swap_valid gs s) :
    gs.auth.seqno = s.current_seqno := replay_prevented gs.auth s h.1

end X402TON.DeDust
