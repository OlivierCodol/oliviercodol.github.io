---
layout: page
title: Materials
permalink: /materials/
description: This page indexes materials I found useful for familiarizing myself with new or otherwise challenging concepts. I hope they are useful to others as well.
nav: true
nav_order: 8
display_categories: [Computational Neuroscience of Movement, Optimal Control Theory, Mathematics, Machine Learning]
horizontal: false
---

<div class="collection">
<!-- Display categorized projects -->
{% for category in page.display_categories %}
<a id="{{ category }}" href=".#{{ category }}">
  <h2 class="category">{{ category }}</h2>
</a>
{% assign categorized_projects = site.materials | where: "category", category %}
{% assign sorted_projects = categorized_projects | sort: "importance" %}
<!-- Generate accordion for each project -->
<div class="accordion accordion-flush mb-3">
  {% for project in sorted_projects %}
    {% case project.medium %}
      {% when 'video' %}
        {% assign project_icon = "<span class='video-icon'></span>" %}
      {% when 'book' %}
        {% assign project_icon = "<span class='book-icon'></span>" %}
      {% when 'course' %}
        {% assign project_icon = "<span class='course-icon'></span>" %}
      {% else %}
        {% assign project_icon = "" %}
    {% endcase %}
    {% assign wrapped_project_title = "<h5 style='font-weight: 500;'>" | append: project_icon | append: project.title | append: "</h5>" %}
    {% include accordion.liquid %}
  {% endfor %}
</div>
{% endfor %}
</div>
