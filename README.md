# MuleSoft Chunked CSV Processor

This MuleSoft flow reads large CSV files from a source SFTP server, processes them in **efficient batches of 2000 records**, transforms the content, and writes the output to a **destination SFTP server** — all with **streaming enabled** to optimize performance and memory usage, while **preserving the original record order**.

---

## What This Flow Does

- Listens for new or updated CSV files on a remote SFTP server  
- Streams the file to avoid memory overload  
- Splits records into batches of 2000 using the `batchSize` attribute in `<foreach>`  
- Transforms each batch (e.g., Java → JSON → flat text)  
- Writes each transformed batch to an export SFTP file using `OVERWRITE` for the first chunk, then `APPEND` for the rest  
- Preserves the original record order throughout processing  

---

## Why Streaming and Batching Matter

- Streaming avoids loading the entire file into memory  
- Batching with `batchSize=2000` enables grouped transformation and reduces write operations  
- Performance improves by minimizing the number of SFTP write calls  
- Write mode switching (`OVERWRITE`/`APPEND`) ensures data consistency and avoids fragmentation  

> **Note:** The `batchSize` value is arbitrary and should be adjusted based on testing, data structure, and available memory. A deep understanding of your payload is essential.

---

## Architecture Diagram

![diagram](https://github.com/user-attachments/assets/46e83781-1009-49b6-9850-2fa867e37515)

---

## Outcome

This approach enables:

- Efficient handling of large datasets  
- Minimal memory footprint through streaming  
- Reduced SFTP I/O overhead  
- Preserved processing order  
- Clean, scalable, production-ready integration

---

## Technologies Used

- MuleSoft 4.x  
- SFTP Connector  
- DataWeave 2.0  
- Docker

---

## Author

Created by Saša Jovanović – feel free to contribute or report issues.
