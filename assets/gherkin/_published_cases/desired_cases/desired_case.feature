# Feature 11
Feature: Conduct normal process # desired process outcome
    - As the Quality Manager,
    - I want to conduct a normal process that transfers the work piece from the input conveyor to the target location (the output conveyor) in time,
    - so production delay is low.

    Background:
        Given "the input conveyor" "works well"
        Given "the output conveyor" "works well"
        Given "the robot" with "a gripper" "works well"
        Given "the logistics operator" is "well trained"
        Given "the work piece" in good condition

    Scenarios: 
        # Scenario 111: Move work piece on conveyor to exit
        Scenario: Move work piece on conveyor to exit
            Given "the work piece" on "the input conveyor"
            When "the input conveyor" moves "the work piece"
            Then "the work piece" arrives "at the exit" "in time"

        # Scenario 112: Pick up work piece from conveyor
        Scenario: Pick up work piece from conveyor
            Given "the work piece" at "the exit" of "the input conveyor"
            When "the robot gripper" picks up "the work piece"
            Then "the work piece" is "picked up" successfully "in time"

        # Scenario 113: Transfer the work piece to the target location
        Scenario: Transfer the work piece to the target location
            Given "the work piece" is "picked up" on "the gripper"
            When "the robot gripper" transfers "the work piece"
            Then "the work piece" arrives over "the target location" "in time"

        # Scenario 114: Place the work piece on the target location
        Scenario: Place the work piece on the target location
            Given "the work piece" over "the target location"
            When "the robot gripper" places "the work piece"
            Then "the work piece" arrives at "the target location" "in time"