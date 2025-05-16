%dw 2.0
output application/json
import * from dw::core::Strings

---
payload map ((item, indexOfItem) -> {
	area: repeat(" ", 5),
	workplace: item.store[0],
	insert: repeat(" ", 5),
	date: item.date[0],
	insert: repeat(" ", 5),
	timeFrom: item.start[0],
	insert: repeat(" ", 5),
	timeUntil: item.end[0],
	insert: repeat(" ", 5),
	sales: repeat(" ", 5),
	numberOfCustomers: repeat(" ", 5),
	quantity: repeat(" ", 5),
	numberOfVisitors: item.visitors[0]
})