%dw 2.0
output text/plain
---
(payload map ((item) -> item pluck $ joinBy  "" ++ "\n")) joinBy("")