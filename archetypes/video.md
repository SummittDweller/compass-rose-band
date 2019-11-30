---
title: "{{ replace .Name "-" " " | title }}"
type: video
url: "/videos/{{ replace .Name "-" " " | lower }}.mp4"
lastMod: {{ now.Format "2006-01-02" }}
date: {{ .Date }}
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

Replace this text with some text describing the video. You can use Markdown here.
