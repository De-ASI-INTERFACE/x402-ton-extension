# x402-TON Extension
**HTTP 402 Payment-Gated Routing on TON (The Open Network)**
**Author:** Richard Patterson (@De-ASI-INTERFACE) | **Version:** 1.0.0 | **Date:** 2026-07-09

## Overview
The x402-TON Extension adapts the x402 HTTP 402 payment standard to TON using FunC/Tact smart contracts, Jetton (TEP-74) token standard, and TON's unique actor-model cell-based message passing. It defines `scheme: ton-toncoin` for native Toncoin and `scheme: ton-jetton` for Jetton token payments, with STON.fi v2 and DeDust as canonical DEX routing surfaces. TON's infinite sharding architecture requires payment gates that handle async message delivery with bounce handling. Lean 4 proofs verify logical time (LT) ordering, seqno replay prevention, and Jetton wallet ownership.
**Reference ID:** RP-DEASI-TON-2026-0709-001
