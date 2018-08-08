extends CanvasLayer

const BLACK = Color(0, 1, 1, 1)

var image
var ScreenSize
var drawing = false


func _ready():
    ScreenSize = get_viewport().size
    init()

func init():
    image = Image.new()
    image.create(Global.size.x, Global.size.y, false, Image.FORMAT_RGBF)
    image.lock()
    update()

func update():
    var texture = ImageTexture.new()
    texture.create_from_image(image)
    texture.flags = 0
    $CImage.texture = texture

func draw(position, color):
    image.set_pixel(position.x, position.y, color)

func _input(event):
    if Input.is_mouse_button_pressed(BUTTON_LEFT):
        drawing = true
    elif Input.is_action_just_pressed("ui_cancel"):
        init()
    else:
        drawing = false

func _process(delta):
    if drawing and not Global.popup:
        var pos = (get_viewport().get_mouse_position() - $CImage.position + Global.size*($CImage.scale.x/2) ).round() / $CImage.scale.x
        draw(pos, Global.color)
        update()