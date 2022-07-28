---
title: example code iterator pattern
tags:
- ✨extract
---


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
## References

### position
>  https://www.youtube.com/watch?v=uNTNEfwYXhI&t=5588s
### author
>  [Christopher Okhravi](/Authors/Christopher%20Okhravi.md)
