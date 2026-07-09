-- ============================================================
-- x402-TON: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: TON / Jetton / DeDust v2
--
-- Re-exports X402TON.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
--
-- Note: TON wallet contracts use a monotone seqno counter for
-- replay protection, so replay_prevented returns an equality:
-- a.seqno = s.current_seqno.
-- ============================================================
import X402TON.PaymentVerification

namespace X402TON

/-- Alias: seqno freshness under the TON chain prefix.
    TON replay protection uses wallet contract seqno equality:
    a.seqno = s.current_seqno. -/
theorem ton_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.seqno = s.current_seqno :=
  replay_prevented a s h

/-- Alias: Unix timestamp expiry enforcement under the TON chain prefix.
    Delegates to within_expiry: s.block_time ≤ a.valid_until. -/
theorem ton_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time ≤ a.valid_until :=
  within_expiry a s h

end X402TON
