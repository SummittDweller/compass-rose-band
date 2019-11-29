---
title: "{{ replace .Name "-" " " | title }}"
type: performance
lastMod: {{ now.Format "2006-01-02" }}
date: {{ .Date }}
startTime: "5pm"
endTime: "9pm"
location: "{{ replace .Name "-" " " | title }}"
city: "Cedar Rapids, IA"
venues:
  - "optional city here"
  - "optional location/venue here"
description: "Text about this post"
publishDate: {{ now.Format "2006-01-02" }}
lastMod: {{ now.Format "2006-01-02" }}
draft: false
---

Replace this text with your performance content. You can use Markdown here.
