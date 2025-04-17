---
layout: page
title: Research
permalink: /research/
description: Here is a brief outline of the research questions I have explored over the years.
nav: true
nav_order: 2
nav_column: science
---

<!-- pages/research.md -->
{% assign sorted_projects = site.research | sort: "importance" %}

{% for project in sorted_projects %}
<div class="accordion accordion-flush mb-3">
  {% include accordion.liquid %}
</div>
{% endfor %}
