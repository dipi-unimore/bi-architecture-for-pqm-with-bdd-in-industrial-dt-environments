# Features with undesired process outcome
# Strategy: backtrack from undesired outcome of interest

# Feature 23: Special cases with adaptation to recover from special case
Feature: Special cases with adaptation to recover from special case
    - As the Quality Manager,
    - I want a resilient, adaptive process to pick up and transfer a work piece with the robot gripper,
    - so production delay is reduced.

    Background:
        Given "the input conveyor" "works well"
        Given "the output conveyor" "works well"
        Given "the robot" with "a gripper" "works well"
        Given "the logistics operator" is "well trained"
        Given "the work piece" in good condition
        Given "the work piece" at "the exit" of "the input conveyor"
    
    Scenarios:
        # Scenario 231: Variation in input materials without adaptation
        Scenario: Variation in input materials without adaptation
            Given "robot gripper positioning" is "inaccurate"
            When "the operator" adapts "robot gripper positioning"
            Then "the robot gripper" transfers "the work piece"
            Then "the work piece" arrives over "the target location" "in time"

        # Scenario 232: Variation in input materials without adaptation
        Scenario: Variation in input materials without adaptation
            Given "environment humidity" is "high"
            When "the operator" dries "the robot gripper"
            Then "the robot gripper" transfers "the work piece"
            Then "the work piece" arrives over "the target location" "in time"

        # Scenario 233: Variation in input materials without adaptation
        Scenario: Variation in input materials without adaptation
            Given "gripper adhesion" to "the work piece" is "insufficient"
            When "the operator" adapts "the robot gripper"
            Then "the robot gripper" transfers "the work piece"
            Then "the work piece" arrives over "the target location" "in time"

        # Scenario 234: Variation in input materials without adaptation
        Scenario: Variation in input materials without adaptation
            Given "the work piece" does not arrive over "the target location" "in time"
            When "the operator" recovers "the work piece"
            Then "the robot gripper" places"the work piece"
            Then "the work piece" arrives at "the target location" "in time"