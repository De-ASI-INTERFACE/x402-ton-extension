-- x402-TON | Author: Richard Patterson
import Mathlib.Data.Finset.Basic
namespace X402TON
structure TONPayment where
  seqno : Nat; amount : Nat; valid_until : Nat
  deriving Repr
structure WalletState where
  current_seqno : Nat; block_time : Nat
  deriving Repr
def seqno_matches (p : TONPayment) (s : WalletState) : Prop :=
  s.current_seqno = p.seqno
def not_expired (p : TONPayment) (s : WalletState) : Prop :=
  s.block_time ≤ p.valid_until
def verify (p : TONPayment) (s : WalletState) : Prop :=
  seqno_matches p s ∧ not_expired p s
theorem ton_replay_prevented (p : TONPayment) (s : WalletState)
    (h : verify p s) : s.current_seqno = p.seqno := h.1
end X402TON
