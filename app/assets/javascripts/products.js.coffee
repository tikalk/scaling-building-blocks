jQuery ->
  new ImageCropper()
  
  $(document).ready ->
    $(".slider").each ->
      val = $(this).attr("val")
      $(this).slider
        orientation: "horizontal"
        range: "min"
        max: 100
        value: val
        slide: (event, ui) ->
          id = $(this).attr("for")
          $("#product_" + id).val ui.value

    $("#myCarousel").carousel
	    type: "previous"
	    interval: 4444
  

class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1.333
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#product_crop_x').val(coords.x)
    $('#product_crop_y').val(coords.y)
    $('#product_crop_w').val(coords.w)
    $('#product_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
  	$('#preview').css
  		width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
  		height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
  		marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
  		marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
