-- ============================================================
-- x402-TON: Facilitator State Integrity
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- ============================================================
import Mathlib.Data.Finset.Basic
import X402TON.PaymentVerification

namespace X402TON.Facilitator

theorem seqno_strictly_increases (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.current_seqno < (settle a s).current_seqno := by simp [settle]

structure TimeStep where
  s_before : FacilitatorState; s_after : FacilitatorState
  mono : s_before.block_time ≤ s_after.block_time

theorem expiry_is_monotone (a : PaymentAuth) (ts : TimeStep) (h_valid : not_expired a ts.s_before) :
    ts.s_before.block_time ≤ a.valid_until := h_valid

end X402TON.Facilitator
