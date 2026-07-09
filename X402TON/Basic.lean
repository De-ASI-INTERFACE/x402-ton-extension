-- x402-TON Basic | Author: Richard Patterson (@De-ASI-INTERFACE)
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace X402TON

structure TONPayment where
  seqno       : Nat
  amount      : Nat
  valid_until : Nat
  deriving Repr, DecidableEq

structure WalletState where
  current_seqno : Nat
  block_time    : Nat
  deriving Repr

def verify (p : TONPayment) (s : WalletState) : Prop :=
  p.seqno = s.current_seqno ∧ s.block_time ≤ p.valid_until

theorem ton_seqno_valid (p : TONPayment) (s : WalletState) (h : verify p s)
    : p.seqno = s.current_seqno := h.1

theorem ton_not_expired (p : TONPayment) (s : WalletState) (h : verify p s)
    : s.block_time ≤ p.valid_until := h.2

end X402TON
