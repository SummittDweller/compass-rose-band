---
title: "{{ replace .Name "-" " " | title }}"
type: performance
date: {{ .Date }}
startTime: "5pm"
endTime: "9pm"
location: "{{ replace .Name "-" " " | title }}"
city: "Cedar Rapids, IA"
description: "Text about this post"
publishDate: {{ now.Format "2006-01-02" }}
lastMod: {{ now.Format "2006-01-02" }}
draft: true
---

Replace this text with your performance content. You can use Markdown here.
