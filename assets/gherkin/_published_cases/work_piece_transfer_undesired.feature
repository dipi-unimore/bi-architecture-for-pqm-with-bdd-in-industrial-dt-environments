Scenario: Transfer of the Work-Piece in undesired conditions
Given "Robot-Vacuum-Gripper" "gripper positioning" is "inaccurate"
Given "Robot-Vacuum-Gripper" has picked "the Work-Piece"
When "Robot-Vacuum-Gripper" transfers "the Work-Piece" to "destination"
Then "Robot-Vacuum-Gripper" "adhesion" is "insufficient"
Then "Work-Piece Transfer" "failed" # Undesired outcome