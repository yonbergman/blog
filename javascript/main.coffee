---
---
;

class MovingDoodle
  EYELESS_SRC: "/images/doodle-eyeless.png"
  EYES_SRC: "/images/doodle-eyes.png"

  constructor: ->
    @el = document.getElementById('doodle')
    @loadImages()

  loadImages: ->
    img = new Image()
    img.onload = @loadingDone
    img.src = @EYELESS_SRC
    eyeImg = new Image()
    eyeImg.src =  @EYES_SRC

  loadingDone:  =>
    @el.classList.add("interactive", "blink")
    @startFollowingMouse()

  startFollowingMouse: =>
    window.onmousemove = @onMouseMove
    window.onmouseout = @resetView

  onMouseMove: (ev) =>
    try
      rect = @el.getBoundingClientRect()
      thirdX = if ev.x < rect.left then 0 else if ev.x > rect.right then 2 else 1
      thirdY = if ev.y < rect.top then 0 else if ev.y > rect.bottom then 2 else 1
      className = "#{['t', 'm', 'b'][thirdY]}#{['l', 'c', 'r'][thirdX]}"
      @resetView()
      @el.classList.add(className);
    catch error
      console.error("error with moving doodle", error)
      window.onmousemove = null


  resetView: =>
    @el.classList.remove("tl",'tc','tr','ml','mc','mr','bl','bc','br')

new MovingDoodle()