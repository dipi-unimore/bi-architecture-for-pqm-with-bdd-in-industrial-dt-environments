# Special case: The Robot-Vacuum-Gripper grips the Work-Piece and lifts the Work-Piece and transfers the Work-Piece and misplaces the Work-Piece.
Feature: failure of gripper in the positioning phase

    Special case:
	The Robot-Vacuum-Gripper grips the Work-Piece and lifts the Work-Piece and transfers the Work-Piece and misplaces the Work-Piece.

	Background: 
		Given an Input-Conveyor equipped with a light-barrier (sensor) and a motor (actuator) 
		And a Robot-Vaccum-Gripper equipped with a vacuum gripper (sensors) and 3 encoder motors (actuators)
		And an Output-Conveyor equipped with a light-barrier (sensor) and a motor (actuator) 
		And a Work-Piece to transfer from the Input-Conveyor to the Output-Conveyor using the Robot-Vacuum-Gripper

	Scenarios:
		# Placehoder number 0 ... 11
		# ... Same as normal case

		# Placehoder number 12u
		Scenario: Robot-Vacuum-Gripper lowering the Work-Piece in undesired conditions
            Given the Robot-Vacuum-Gripper
			And the Robot-Vacuum-Gripper gripper is activated
			And the Robot-Vacuum-Gripper is at the Output-Conveyor location
			And the Robot-Vacuum-Gripper gripper does not work well		# Note: not measurable, but we can say that it implies the need of persitency to measure that the gripper does not work well.
			And the Robot-Vacuum-Gripper do not stick to the product 	# Note: not measurable, but we can say that it implies the need of persitency to measure that the gripper does not work well.
			And I add log entry in the log file "scenario 4.1u"	 		# The log is for sake of counting, to understand how many times the next line happens or not.
			And the Robot-Vacuum-Gripper stops
			When the Robot-Vacuum-Gripper lowers its arm
            Then the Robot-Vacuum-Gripper gripper fails and the Work-Piece is lost # Undesired
		
		# Placehoder number 13u
		Scenario: The Work-Piece is detected by the light-barrier
			Given the Robot-Vacuum-Gripper
			And the Output-Conveyor
            And the Output-Conveyor is off
			And the Robot-Vacuum-Gripper gripper is activated
			And the Robot-Vacuum-Gripper is at the Output-Conveyor location
			And the Work-Piece is lost
			When the Robot-Vacuum-Gripper is lowering its arm
			Then the Output-Conveyor light-barrier do not detect the Work-Piece
			# OR - if the piece falls exactly in the range of the Output-Conveyor light-barrier 
			# Note: it depends by the Robot arm heigth at which the Work-Piece is lost
			Then the Work-Piece is in the range of the the Output-Conveyor light barrier
            And the Output-Conveyor light-barrier detects the Work-Piece
		
		# Placehoder number 14u
		Scenario: The Robot-Vacuum-Gripper Vacuum Gripper Stops at the Output-Conveyor light-barrier location in undesired conditions
            Given the Robot-Vacuum-Gripper 
			And the Output-Conveyor
            And the Output-Conveyor is off
			And the Robot-Vacuum-Gripper gripper is activated
			And the Robot-Vacuum-Gripper is at the Output-Conveyor location
			And the Robot-Vacuum-Gripper is lowering its arm
			And the Work-Piece is lost
			When the Robot-Vacuum-Gripper reaches the designated height
			Then the Robot-Vacuum-Gripper stops lowering its arm

		# Placehoder number 15u
		Scenario: The Robot-Vacuum-Gripper Vacuum Gripper detaches the Work-Piece in undesired conditions
			Given the Robot-Vacuum-Gripper
			And the Output-Conveyor
            And the Output-Conveyor is off
			And the Robot-Vacuum-Gripper gripper is activated
			And the Robot-Vacuum-Gripper is at the Output-Conveyor location
			And the Robot-Vacuum-Gripper is lowered
			And the Work-Piece is lost
			When 3 seconds has passed after the Robot-Vacuum-Gripper arm has stopped
			Then Robot-Vacuum-Gripper deactivates the gripper, thus releasing the workpiece
		
		# Placehoder number 16u
		Scenario: The Output-Conveyor reaches the timeout in undesired conditions
			Given the Output-Conveyor
			And the Work-Piece is lost
			When the Output-Conveyor timer overcomes the time out limit
			Then the Output-Conveyor raises an alarm
