# Normal case: The Robot-Vacuum-Gripper grips, lifts, transfers, and places the Work-Piece successfully.
Feature: successful transfer of a Work-Piece
    # Modify considering Steps that can be measured by the simple PLC scenario.

	Normal case:
	The Robot-Vacuum-Gripper grips, lifts, transfers, and places the Work-Piece successfully.

	Background: 
		Given an Input-Conveyor equipped with a light-barrier (sensor) and a motor (actuator) 
		And a Robot-Vaccum-Gripper equipped with a vacuum gripper (sensors) and 3 encoder motors (actuators)
		And an Output-Conveyor equipped with a light-barrier (sensor) and a motor (actuator) 
		And a Work-Piece to transfer from the Input-Conveyor to the Output-Conveyor using the Robot-Vacuum-Gripper 
        # The last "And" is visually verified by experts.

    Scenarios:
        # Placehoder number 0
        Scenario: Work-Piece moves on the Input-Conveyor
            Given the Input-Conveyor
            And the Input-Conveyor is off
            # The following "When" is triggered because the previous machine ended its task
            When the machine before the Input-Conveyor gives to the Input-Conveyor the signal to start
            Then Input-Conveyor motor is on

        # Placehoder number 1
        Scenario: Work-Piece reaches the conveyor exit
            Given the Input-Conveyor
            And the Input-Conveyor is on
            When the Work-Piece is in the range of the the Input-Conveyor light barrier
            Then the Output-Conveyor light-barrier detects the Work-Piece

        # Placehoder number 2
        Scenario: Conveyor stops
            Given Input-Conveyor
            And Input-Conveyor is on
            When the Work-Piece is detected by the Input-Conveyor light barrier
            Then Input-Conveyor is off

        # Placehoder number 3
        Scenario: Robot-Vacuum-Gripper moving towards the Work-Piece at the Input-Conveyor exit
            Given the Input-Conveyor
            And the Input-Conveyor is off
            When the Work-Piece is detected by the light-barrier of the Input-Conveyor
            Then the Vacuum Robot-Vacuum-Gripper Gripper activates and moves towards the Work-Piece

        # Placehoder number 4
        Scenario: Robot-Vacuum-Gripper arriving on the Work-Piece at the Input-Conveyor exit
            Given the Input-Conveyor
            And the Input-Conveyor is off
            And the Work-Piece is at the Input-Conveyor light-barrier
            And the Robot-Vacuum-Gripper is moving towards the Work-Piece
            When the Robot-Vacuum-Gripper reaches the light-barrier location of the Input-Conveyor
            Then the Robot-Vacuum-Gripper stops

        # Placehoder number 5
        Scenario: Robot-Vacuum-Gripper lowering the arm
            Given the Input-Conveyor
            And the Input-Conveyor is off
            And he Work-Piece is at the Input-Conveyor light-barrier
            And the Robot-Vacuum-Gripper is over the Work-Piece
            When the Robot-Vacuum-Gripper stops
            Then the Robot-Vacuum-Gripper lowers its arm

        # Placehoder number 6
        Scenario: Robot-Vacuum-Gripper stopping the arm lowering
            Given the Input-Conveyor
            And the Input-Conveyor is off
            And the Work-Piece is at the Input-Conveyor light-barrier
            And the Robot-Vacuum-Gripper  is over the Work-Piece
            And the Robot-Vacuum-Gripper is lowering its arm
            When the Gripper fo the Robot-Vacuum-Gripper reaches the target Y location # i.e., is at the right height
            Then the Robot-Vacuum-Gripper stops lowering its arm

        # Placehoder number 7
        Scenario: Robot-Vacuum-Gripper grabbing the Work-Piece at the Input-Conveyor exit
            Given the Input-Conveyor
            And the Input-Conveyor is off
            And the Work-Piece is at the Input-Conveyor light-barrier
            When the Robot-Vacuum-Gripper has stopped lowering its arm  # i.e. is at the target location (both at the X and Y dimenension)
            Then the Robot-Vacuum-Gripper activates the gripper

        # Placehoder number 8
        Scenario: Lifting the Work-Piece
            Given Input-Conveyor
            And the Input-Conveyor is off 
            And the Work-Piece is at the Input-Conveyor light-barrier
            And the Robot-Vacuum-Gripper arm is lowered
            And the Robot-Vacuum-Gripper gripper is activated
            When 3 seconds has passed after the activation of the gripper
            Then the Robot-Vacuum-Gripper lifts
        
        # Placehoder number 9
        Scenario: Work-Piece undetected by the Input-Conveyor
            Given the Input-Conveyor 
            And the Input-Conveyor is off 
            And the Robot-Vacuum-Gripper
            And the Robot-Vacuum-Gripper gripper is activated
            When the Robot-Vacuum-Gripper is lifting
            Then the Work-Piece is out of the range of the the Input-Conveyor light barrier
            And the Output-Conveyor light-barrier undetects the Work-Piece

        # Placehoder number 10
        Scenario: Transfering the Work-Piece
            Given the Robot-Vacuum-Gripper 
            And the Robot-Vacuum-Gripper gripper is activated
            When the Robot-Vacuum-Gripper has lifted
            Then the Robot-Vacuum-Gripper moves towards the Output-Conveyor at its light-barrier location

        # Placehoder number 11
        Scenario: Robot-Vacuum-Gripper arriving at the Output-Conveyor entrance with the Work-Piece
            Given the Robot-Vacuum-Gripper 
            And the Robot-Vacuum-Gripper gripper is activated
            And the Robot-Vacuum-Gripper is moving towards the Output-Conveyor
            When the Robot-Vacuum-Gripper reaches the light-barrier location of the Output-Conveyor
            Then the Robot-Vacuum-Gripper stops

        # Placehoder number 12
        Scenario: Robot-Vacuum-Gripper lowering the Work-Piece
            Given the Robot-Vacuum-Gripper
            And the Robot-Vacuum-Gripper gripper is activated
            And the Robot-Vacuum-Gripper is at the Output-Conveyor location
            When the Robot-Vacuum-Gripper stops
            Then the Robot-Vacuum-Gripper lowers its arm

        # Placehoder number 13
        Scenario: The Work-Piece is detected by the light-barrier
            Given the Robot-Vacuum-Gripper 
            And the Output-Conveyor
            And the Output-Conveyor is off
            And the Robot-Vacuum-Gripper gripper is activated
            And the Robot-Vacuum-Gripper is at the Output-Conveyor location
            And the Robot-Vacuum-Gripper is lowering its arm
            When the Work-Piece is in the range of the Output-Conveyor-light barrier 
            Then the Output-Conveyor light-barrier detects the Work-Piece

        # Placehoder number 14
        Scenario: The Robot-Vacuum-Gripper Stops at the Output-Conveyor light-barrier location
            Given the Robot-Vacuum-Gripper 
            And the Output-Conveyor
            And the Output-Conveyor is off
            And the Robot-Vacuum-Gripper gripper is activated
            And the Robot-Vacuum-Gripper is at the Output-Conveyor location
            And the Robot-Vacuum-Gripper is lowering its arm
            When the Robot-Vacuum-Gripper reaches the designated height
            Then the Robot-Vacuum-Gripper stops lowering its arm

        # Placehoder number 15
        Scenario: The Robot-Vacuum-Gripper detaches the Work-Piece
            Given the Robot-Vacuum-Gripper
            And the Output-Conveyor
            And the Output-Conveyor is off
            And the Robot-Vacuum-Gripper gripper is activated
            And the Robot-Vacuum-Gripper is at the Output-Conveyor location
            And the Robot-Vacuum-Gripper is lowered
            And the Output-Conveyor light-barrier is detecting the Work-Piece
            When 3 seconds has passed after the Robot-Vacuum-Gripper arm has stopped
            Then Robot-Vacuum-Gripper deactivates the gripper, thus releasing the Work-Piece
