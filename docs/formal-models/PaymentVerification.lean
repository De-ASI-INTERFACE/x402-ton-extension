-- x402-TON Payment Verification | Author: Richard Patterson
import X402TON.Basic

namespace X402TON.Verification

def settle (p : TONPayment) (s : WalletState) (h : verify p s) : WalletState :=
  { s with current_seqno := s.current_seqno + 1 }

theorem settled_seqno_incremented (p : TONPayment) (s : WalletState) (h : verify p s)
    : (settle p s h).current_seqno = s.current_seqno + 1 := by
  simp [settle]

end X402TON.Verification
