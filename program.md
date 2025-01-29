---
title: Program
layout: page
feature_image: "image2.jpg"
image_source: "Andrey Sulitskiy"
---

{% assign tentative = false %}
{% assign ready = false %}

{% if ready %}

{% if tentative %}
Please be aware that this is a tentative version of the conference program.
The finalised version will be published at the beginning of February.
{% endif %}

<style>
  td { padding: 8px; 
    border-top: 1px solid #ddd; 
    border-bottom: 1px solid #ddd;
  }
  .left-td {  border-right: 4px solid #ddd; }
  .right-td {  border-left: 4px solid #ddd; }
  .presentation { margin-top: 1em; }
  .btn:focus { outline: 0 !important; }
</style>

{% for day in site.data.program %}

<div style="margin-top:30px;background-color:{{ day.color }};border-radius: 5px 5px 0px 0px;padding-left: 5px;padding-bottom: 20px;padding-top: 1px;"><h1>{{ day.day }} - {{ day.theme }}</h1></div>
<table class="col-xs-12">
  <tbody>
      {% for event in day.events %}
      <tr {% if event.non-session %} style="background-color:#ececec"{% endif %}>
        <td class="left-td col-xs-1">
          <strong>{{event.from}}</strong><br>
          <strong class="text-muted">{{event.to}}</strong>
        </td>
        <td class="right-td">
          {% if event.link %}
          <a href="{{site.url}}/{{event.link}}">
          <img style="max-height:2em; margin-bottom:10px;" src="{{ site.url }}/assets/images/pdf.png" alt=""> 
          {% endif %}
          <span class="text-primary lead">{{event.title}}</span>
          {% if event.link %}
          </a>
          {% endif %}
          {% if event.authors %}
          <br>
          {% for author in event.authors %}
            {% if author.title %} 
              {{author.title}}: <strong>{{author.name}}</strong>
            {% else %}
              {{event.author}}
            {% endif %}      
          {% endfor %}
          {% endif %}
          {% if event.slides %}
            <br>
            <a target="_blank" style="color:white" href="{{site.url}}/assets/{{event.slides}}"><label class="btn btn-xs btn-success">
            <span class="glyphicon glyphicon-circle-arrow-down"></span> Slides</label></a> 
            <br>
          {% endif %}
          {% if event.description %}
            <br>
            <span class="text-muted">{{ event.description }}</span>
            <br>
          {% endif %}
          {% if event.papers.size > 0 %}
            {% for pid in event.papers %}
              {% assign id = pid | minus: 1 %}
              {% assign paper = site.data.papers[id]%}
              <div class="presentation">
              <strong>{{ paper.title }}</strong>
              <br>
              <strong class="text-muted">
                {% if paper.authors.size == 1 %}
                Author:
                {% else %}
                Authors:
                {% endif %}
                {% for author in paper.authors %}
                  {{author}}{% if forloop.last == false %}; {% endif %}
                {% endfor %}
              </strong>
              {% unless tentative %}
              <br>
              <a target="_blank" style="color:white" href="{{paper.link}}">
                <label class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-circle-arrow-down"></span> Paper
              </label></a>
              <label class="abstract_btn btn btn-xs btn-info">
                Abstract</label>
              {% if paper.slides %}
              <a target="_blank" style="color:white" href="/2019/slides/papers/{{paper.slides}}">
                <label class="btn btn-xs btn-success"> <span class="glyphicon glyphicon-circle-arrow-down"></span> Slides</label></a> 
              {% endif %}
              <div style="display:none;" class="abstract">
              <div style="margin-left: 30px;margin-top: 10px;" class="bg-warning">{{paper.abstract}}</div>
              </div>
              {% endunless %}
              </div>
            {% endfor %}
          {% endif %}
          {% if event.chairs %}
            <br>
            {% if event.chairs.size == 1 %}
                Chair: <strong>{{event.chairs[0]}}</strong>
            {% else %}
                Chairs: <strong>{{event.chairs | join: ", "}}</strong>
            {% endif %}
          {% endif %}
          <br>
          {% if event.location %} Location: <strong>{{event.location}}</strong> {% endif %}
        </td>
      </tr>
      {% endfor %}
  </tbody>
</table>
<div stlye="margin-bottom:50px;" class="clearfix"></div>
{% endfor %}
<script>
  $( document ).ready( function() {
    $( ".abstract_btn" ).click( function(event) {
      $( event.target ).siblings( ".abstract" ).slideToggle('fast');
    });
  });
</script>
{% else %}
TBD
{% endif %}

