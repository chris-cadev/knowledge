---
title: code to reverse columns in relation ships
tags:
- ✍️annotation
---


<table>
<tr>
<td> type </td>
<td> #✍️annotation </td>
</tr>
<tr>
<td> position </td>
<td> <a href="https://youtu.be/fAHkJ_Dhr50?t=831">https://youtu.be/fAHkJ_Dhr50?t=831</a> </td>
</tr>
<tr>
<td> author </td>
<td> [Thu Vu data analytics](/Authors/Thu%20Vu%20data%20analytics.md) </td>
</tr>
</table>


---

# code to reverse columns in relation ships
```python
import pandas as pd
import numpy as np
relationships_df = ...
relationships_df = pd.DataFrame(np.sort(relationships.values, axis = 1), columns = relationships_df.columns)
...
```
