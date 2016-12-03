# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log("loaded expensive script")
$(document).ready ->
  $(".js-new-subcategory").hide()

  $("#expensive_category_id").on 'change', ->

    $('#expensive_subcategory_id').empty()
    categoryId = $("#expensive_category_id").val()

    console.log categoryId

    url = "/api/catalog/getSubcategories/" + categoryId
    loadSubcategories url

loadSubcategories = (url) ->
  console.log "load data"
  $.ajax
    url: url
    dataType: "html"
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      category = JSON.parse data
      subcategories = category["Subcategory"]
      if subcategories.length > 0
        $(".js-new-subcategory").hide()
        $('#expensive_subcategory_id').prop('disabled', false)

        $.each subcategories, (index)->
          $('#expensive_subcategory_id')
            .append("<option value=" + subcategories[index]["id"] + ">" + subcategories[index]["Name"] + "</option>");
      else
        $('#expensive_subcategory_id')
          .append("<option value='-1'> Subcategory is requierd</option>");
        $('#expensive_subcategory_id').prop('disabled', true)
        $(".js-new-subcategory").show()
