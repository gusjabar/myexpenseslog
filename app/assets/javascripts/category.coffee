# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  console.log("loaded category script")
  $.ajax
    url: "/api/catalog/getSubcategories/8"
    dataType: "html"
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      categories = JSON.parse data
      list = "<ul>"
      $.each categories, (index)->
        subcategories = categories[index]["Subcategory"]
        if subcategories
          list += "<li>"  + categories[index]["Name"] + "<ul>"
          $.each subcategories, (subIndex)->
            list += "<li>"  + subcategories[subIndex]["Name"] + "</li>"
          list += "</ul></li>"
        else
          list += "<li>"  + categories[index]["Name"] + "</li>"
      list +="</ul>"
      $('#content').append list
