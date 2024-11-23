WeChat: cstutorcs
QQ: 749389476
Email: tutorcs@163.com
.include "constants.asm"
.include "macros.asm"

.globl game
.text


game:
	enter

_game_while:

	jal	handle_input


	# Move stuff

	# Draw stuff


	li	a0, 5
	li	a1, 5
	# This is a macro defined in macros.asm
	lstr	a2, "Press x"
	jal	display_draw_text

	li	a0, 11
	li	a1, 11
	# This is a macro defined in macros.asm
	lstr	a2, "to exit"
	jal	display_draw_text

	# Must update the frame and wait
	jal	display_update_and_clear
	jal	wait_for_next_frame


	# Leave if x was pressed
	lw	t0, x_pressed
	bnez	t0, _game_end


	j	_game_while

_game_end:
	# Clear the screen
	jal	display_update_and_clear
	jal	wait_for_next_frame

	leave
