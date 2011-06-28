from .. import NogginConstants as NogCon

# We dont use STRAFE RIGHT NOW
STRAFE_ONLY = True
STRAFE_SPEED = 0.3

# Distance at which we use active localization
ACTIVE_LOC_THRESH = 150.



# SAVE
DONT_SAVE_LIMIT = 120

#The goalie squat save width to one side
CENTER_SAVE_THRESH = 15

# The chasing box
BOX_BUFFER = 10
CHASE_BUFFER = 10
CHASE_RIGHT_X_LIMIT = NogCon.MY_GOALBOX_RIGHT_X + 80
CHASE_UPPER_Y_LIMIT = NogCon.MY_GOALBOX_BOTTOM_Y - BOX_BUFFER
CHASE_LOWER_Y_LIMIT = NogCon.MY_GOALBOX_TOP_Y + BOX_BUFFER

# Sanity checks for chasing
CHASE_RELX_BUFFER = 200
STOP_CHASE_RELX_BUFFER = 160


