---
title: Publications
layout: pageleft
---

{% bibliography sort_by year -T bib%}

{% for year in (2000..2030) reversed %}  
  {% capture bib_entries %}
  {% bibliography --query @*[year = {{year}}] -T bib%}	{% endcapture %}
  {% if  bib_entries.size > 90  %}
  <h2> {{ year }} </h2>
  {{ bib_entries }}
  {% endif %}
{% endfor %}