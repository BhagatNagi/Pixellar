
extends CanvasLayer

var h_pos

func _ready():
	h_pos = $HUD.rect_position.y

func _process(delta):
	display()
	HUD_pos()

func display():
	var text = ""
	
	text += ("Size: " + str(Global.size))
	text += ("\nMode: " + str(Global.mode))
	text += ("\nColor: " + str(Global.color))
	text += "\n" + OS.get_name()
	text += "\n popup:" + str(Global.popup)
	
	$Label.text = text

func HUD_pos():
	if $HUD.rect_position.y > h_pos:
		$HUD.rect_position.y -= abs($HUD.rect_position.y - h_pos) * 0.1
	elif $HUD.rect_position.y < h_pos:
		$HUD.rect_position.y += abs($HUD.rect_position.y - h_pos) * 0.1

func _on_EraseButton_pressed():
	Global.mode = 0
	Global.color = Global.NULL


func _on_ResetButton_pressed():
	$ClearDialogue.popup()


func _on_ClearDialogue_confirmed():
	print("Confirmed")


func _on_ColorButton_pressed():
	$DColor.popup()
	Global.popup = true
	Global.mode = 1


func _on_ColorPicker_color_changed(color):
	Global.color = color
	$HUD/Buttons/ColorButton/Display.color = Global.color


func _on_PullButton_button_up():
	h_pos = 8
	$HUD/PullButton.hide()
	$HUD/PushButton.show()


func _on_PushButton_button_up():
	h_pos = -72
	$HUD/PushButton.hide()
	$HUD/PullButton.show()


func _on_DColor_popup_hide():
	Global.popup = false
