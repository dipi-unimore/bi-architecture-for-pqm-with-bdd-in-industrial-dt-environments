# Features with undesired process outcome
# Strategy: backtrack from undesired outcome of interest

# Feature 21: Special cases that may result in work piece transfer failure

Feature: Special cases that may result in work piece transfer failure
    - As the Quality Manager,
    - I want a resilient, adaptive process to transfer work pieces with the robot gripper,
    - so production delay is reduced.

    Background:
        Given "the input conveyor" "works well"
        Given "the output conveyor" "works well"
        Given "the robot" with "a gripper" "works well"
        Given "the logistics operator" is "well trained"
        Given "the work piece" in good condition
        Given "the work piece" is "picked up" on "the gripper"

    Scenarios:
        # Scenario 211: Transfer the work piece with challenging condition
        Scenario: Transfer the work piece with challenging condition
            Given "robot acceleration" is "high"
            When "the robot gripper" transfers "the work piece"
            Then "the work piece" does not arrive over "the target location" "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 212: Transfer the work piece with challenging condition
        Scenario: Transfer the work piece with challenging condition
            Given "robot gripper positioning" is "inaccurate"
            When "the robot gripper" transfers "the work piece"
            Then "the work piece" does not arrive over "the target location" "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 213: Transfer the work piece with challenging condition
        Scenario: Transfer the work piece with challenging condition
            Given "gripper adhesion" to "the work piece" is "insufficient"
            When "the robot gripper" transfers "the work piece"
            Then "the work piece" does not arrive over "the target location" "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 214: Transfer the work piece with challenging condition
        Scenario: Transfer the work piece with challenging condition
            Given "environment humidity" is "high"
            When "the robot gripper" transfers "the work piece"
            Then "the work piece" does not arrive over "the target location" "in time"
            Then "the system" shall alert "the quality manager"