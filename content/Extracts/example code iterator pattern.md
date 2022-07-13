---
title: example code iterator pattern
tags:
- ✨extract
---


<table>
<tr>
<td> type </td>
<td> #✨extract </td>
</tr>
<tr>
<td> position </td>
<td> <a href="https://www.youtube.com/watch?v=uNTNEfwYXhI&t=5588s">https://www.youtube.com/watch?v=uNTNEfwYXhI&t=5588s</a> </td>
</tr>
<tr>
<td> author </td>
<td> [Christopher Okhravi](/Authors/Christopher%20Okhravi.md) </td>
</tr>
</table>


---

# example code iterator pattern
```java
HandInventory inv = new HandInventory();
InventoryIterator iter = inv.getIterator();
while(!iter.isDone()) {
	Item item = iter.current();
	// do something cool c:
	iter.next();
}
```
