# 🐴 MuleSoft Chunked CSV Processor

This MuleSoft flow reads large CSV files from a source SFTP server, processes them in **efficient batches of 2000 records**, transforms the content, and then writes the output to a **destination SFTP server** — all with **streaming enabled** to optimize performance and resource usage.

---

## 📌 What This Flow Does

- 🔁 **Listens for new or updated CSV files** on a remote SFTP server
- 📥 **Streams the file** to avoid memory overload
- 📊 **Splits records into batches** of 2000 using the `batchSize` attribute in `<foreach>`
- 🔄 **Transforms each batch** (e.g., Java → JSON → flat text)
- 📤 **Writes each transformed batch** to an export SFTP file using `OVERWRITE` for the first chunk, then `APPEND` for the rest

---

## 🧠 Why Streaming and Batching Matter

- **Streaming** prevents the entire file from being loaded into memory
- **Batching with `batchSize=2000`** allows grouped transformation and fewer write operations
- **Performance** is significantly improved by reducing the number of SFTP write calls
- **Write mode switching** (`OVERWRITE`/`APPEND`) ensures data integrity and avoids file fragmentation

> 💡 **Note:** The `batchSize` value is arbitrary and should be determined based on real-world testing, payload size, and available memory. A deep understanding of your data and processing requirements is essential.

---

## 🧩 Architecture Diagram

![diagram](https://github.com/user-attachments/assets/46e83781-1009-49b6-9850-2fa867e37515)


---

## ✅ Outcome

With this pattern, we achieve:

- High-performance processing of large datasets
- Low memory usage and safe streaming
- Minimized SFTP write overhead (from 10,000 writes to just 5–10)
- Clean, scalable, production-ready integration

---

## 📁 Technologies Used

- MuleSoft 4.x
- SFTP Connector
- DataWeave 2.0
- Docker

---

## ✍️ Author

Created by Saša Jovanović – feel free to contribute or report issues.

