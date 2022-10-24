---
title: Publications 
layout: pageleft
---


{% capture Years %}
  {%- for pub in site.data.citations -%}
    {{ pub.Year }}
        {%- if forloop.last == false -%},{%- endif -%}
  {%- endfor -%}
{% endcapture %}


{% assign year_list = Years | remove:' ' |split: ',' | uniq | sort | reverse %}

<!--Introduce Target -->
{%- for year in year_list  -%}
<a href="#{{ year }}"> {{ year  }} </a> | 
{%- endfor -%}


<!--Introduce Target -->


{% for year in year_list  %}
<div class="grant">
<h2 id="{{ year }}"> {{ year }} </h2> 
</div>
 {% include gscholar year = year  include_link=true style="surajit"  %}

{% endfor %}
