{% extends 'full.tpl' %}

{% import 'parts/sos_style.tpl' as sos_style %}
{% import 'parts/preview.tpl' as preview %}

{% block html_head %}
<meta name="viewport" content="width=device-width, initial-scale=1">
{{ super() }}
{{ sos_style.css() }}
{{ preview.css() }}

<style>
   {% for item in nb['metadata'].get('sos', {}).get('kernels', []) %}
   {%- if item[2] -%}
   .lan_{{item[0]}} .input_prompt {
      background-color: {{item[3]}} !important;
    }
   {%- endif -%}
   {% endfor %}
</style>

{% endblock html_head %}

{% block codecell %}
{% if cell['metadata'].get('kernel',none) is not none %}
<div class="lan_{{cell['metadata'].get('kernel', none)}}">
   {{ super() }}
</div>
{% else %}
   {{ super() }}
{% endif %}
{% endblock codecell %}

{% block body %}
{{ super() }}
{{ preview.js() }}
{% block footer_js %}
{% endblock footer_js %}
{% endblock body %}
