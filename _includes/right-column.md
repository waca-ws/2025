<div class="panel panel-primary">
<div class="panel-heading">
<span class="panel-title"><strong>Important Dates</strong></span>
</div>
<ul class="list-group">
{% for date in site.data.dates %}
{% unless date.hide_from contains "website" %}
{% if date.expired %}
<li class="list-group-item alert-danger">
  <div style="margin-left:18px">
  <div style="margin-left:-18px" class="glyphicon glyphicon-check float-left"> </div>
{% else %}
<li class="list-group-item alert-success">
  <div style="margin-left:18px">
  <div style="margin-left:-18px" class="glyphicon glyphicon-unchecked float-left"> </div>
{% endif %}
{% if date.entries %}
  {% for entry in date.entries %}
    {% if entry.date %}
      {% capture t %} 
      <time datetime="{{entry.date}}">
        {{ entry.date | date: "%a %d %b %Y"}}
      </time>
      {% endcapture %}
    {% elsif entry.to and entry.from %}
      {% capture t %} 
        {% capture from %}
          {% assign fy = entry.from | date: "%Y" %}
          {% assign ty = entry.to 	| date: "%Y" %}
          {% assign fm = entry.from | date: "%b" %}
          {% assign tm = entry.to 	| date: "%b" %}
          {% if fy != ty %}
            {{ entry.from | date: "%a %d %b %Y" }}
          {% elsif fm != tm %}
            {{ entry.from | date: "%a %d %b" }}
          {% else %}
            {{ entry.from | date: "%a %d" }}
          {% endif %}
        {% endcapture %}
        <time datetime="{{entry.from}}">{{ from }}</time> - 
        <time datetime="{{entry.to}}">{{ entry.to | date: "%a %d %b %Y"}}</time>
      {% endcapture %}
    {% endif %}
    <span>{% if forloop.first %}
      {{ t }}
      {% if entry.zone %}
        <span data-toggle="tooltip" title="Timezone: {{ entry.zone.label }}">
        <span class="glyphicon glyphicon-time"></span>
        </span>
      {% endif %}
    {% else %}
    <strike>{{ t }}</strike>
    {% endif %}</span>
  {% endfor %}
{% else %}
  <span>TBD</span>
{% endif %}
<br><span>{{ date.summary.website | default: date.summary }}</span>
</div>
</li>
{% endunless %}
{% endfor %}
<!-- <li class="list-group-item">
</li> -->
</ul>
</div>

<style>
 .vcenter { 
  display: inline-block;
  vertical-align: middle;
  float: none;
}
</style>


<div class="panel panel-primary">
<ul class="list-group list-group-item-primary">
<li class="list-group-item list-group-item-primary">
<p class="text-center" style="font-size: 1.4em;">
<strong>Workshop at 
<a href="https://www.discotec.org/2025/">DisCoTec 2025</a>
</strong></p>
</li></ul>
</div>

<div class="panel panel-primary">
<div class="panel-heading">
<strong>Sponsors & Supporters</strong>
</div>
<ul class="list-group">
{% for supporter in site.data.supporters %}
<li class="list-group-item">
  <div class="row">
  <div class="col-xs-7 col-md-9 vcenter"><a href="{{ supporter.link | relative_url }}"><img style="max-height:7vw;" class="img-responsive center-block" src="{{ supporter.logo | relative_url }}" alt="{{supporter.name}}"><p class="text-center">{{supporter.name}}</p></a></div><div class="col-xs-3 col-md-3 text-center text-muted vcenter">{% if supporter.tier %}{{supporter.tier | capitalize }} {% endif%}{{supporter.type}}</div>
  </div>
</li>
{% endfor %}
</ul>
</div>

<script>
$(document).ready(function(){$('[data-toggle="tooltip"]').tooltip();});
</script>


<style>
  .microservices_community_event {
    line-height: 1.05em;
    text-align: left;
    margin-top: 9px;
  }
</style>

{% comment %}

<div class="panel panel-primary">
  <div class="panel-heading">
  <strong>Microservices Community Events</strong>
  </div>
  <ul class="list-group">
  <li class="list-group-item"> 
    <div>Upcoming events</div>
    <div id="microservices_community_events_upcoming"></div>
  </li>
  <li class="list-group-item"> 
    <div>Latests past events</div>
    <div id="microservices_community_events_past"></div>
  </li>
  </div>
</div>

<script>
function microservices_community_events( data ){
  const upcoming = $( "#microservices_community_events_upcoming" )
  data.upcoming.forEach( element => {
    upcoming.append( 
      `<div>
      <a target="_blank" href="${ element.link }">
        <div class="microservices_community_event" >${ element.title }</div>
      </a>
      </div>` )
  });
  const past = $( "#microservices_community_events_past" )
  data.past.forEach( ( element, index ) => {
    if( index > 2 ){ return }
    past.append( 
      `<div>
      <a target="_blank" href="${ element.link }">
        <div class="microservices_community_event" >${ element.title }</span>
      </a>
      </div>` )
  });
}
$( document ).ready( () => {
  const url = "https://www.microservices.community/events.json"
  $.ajax({
    url: url,
    jsonp: "microservices_community_events",
    dataType: "jsonp"
  })
})
</script>

{% endcomment %}