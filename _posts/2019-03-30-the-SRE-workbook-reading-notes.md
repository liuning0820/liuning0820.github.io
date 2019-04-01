---
layout: default
title: "Reading Notes: The Site Reliability Workbook: Practical Ways to Implement SRE"
author: liuning0820
tags: [book]
---

# Reading Notes: The Site Reliability Workbook: Practical Ways to Implement SRE

## Chapter 8 On Call

Google's on-call practice:

- Make sure never achieve reliability at the expense of an on-call engineer’s health.
- SRE work should be a healthy mix of duties: on-call and project work.
- Google SRE target a maximum of two incidents per on-call shift.
- cash compensation for on-call.

The responsibilities of on-call engineers:

- The on-call engineer minimizes user impact first, then makes sure the issues are fully addressed.
- At the start of each shift, the on-call engineer reads the handoff from the previous shift.
- At the end of the shift, the on-call engineer sends a handoff email to the next engineer on-call.

### Test