---
layout:	post
title: Qubes OS Wake from sleep
date:	2020-10-29 14:32:25 CET
categories:	qubes xps suspend sleep wakeup
---

When installing Qubes OS on my XPS15 9570 I discovered that it did not wake from suspend/sleep as expected. Nothing happened when pressing the power button, and the only way to start it again was to do a hard shutdown and then start it again.

Since Qubes do not support hibernation (because of Xen), it seemed crucial to at least have the sleep functionality.

Finally I found this [post](https://www.reddit.com/r/Qubes/comments/gx9zjy/suspend_is_not_working/) from Reddit.

Apperently one needs to edit the file `/boot/efi/EFI/qubes/xen.cfg`, and on the `kernel=` line add the string `mem_sleep_default=deep`.

After that, I rebooted the system and now it seems to suspend and wakeup as expected.
  
