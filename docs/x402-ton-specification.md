# x402-TON Specification
**Author:** Richard Patterson | **Ref:** RP-DEASI-TON-2026-0709-001

## Toncoin Schema (`scheme: ton-toncoin`)
```json
{ "scheme": "ton-toncoin", "network": "mainnet",
  "from": "EQ<base64url-addr>", "to": "EQ<facilitator-addr>",
  "amount": "<nanoton-string>", "seqno": "<uint32>",
  "validUntil": "<unix-timestamp>",
  "body": "<boc-base64-cell>", "signature": "<ed25519-sig>" }
```

## Jetton Schema (`scheme: ton-jetton`)
```json
{ "scheme": "ton-jetton",
  "jettonMaster": "EQ<master-contract>",
  "from": "EQ<sender>", "to": "EQ<facilitator>",
  "amount": "<uint128>", "seqno": "<uint32>",
  "validUntil": "<unix-timestamp>",
  "forwardPayload": "<boc-base64>", "signature": "<ed25519-sig>" }
```

## TON-Specific Invariants
1. **Seqno Replay Prevention:** Wallet contract increments seqno atomically on each message
2. **validUntil Expiry:** Built into TON wallet v4/v5; message rejected after timestamp
3. **Bounce Handling:** Facilitator contract must handle bounced Jetton transfers gracefully
4. **LT Ordering:** Logical time ensures payment message processed before swap message in actor queue
5. **Infinite Sharding:** Payment gate deployed per-shard to maintain low latency across TON shards
