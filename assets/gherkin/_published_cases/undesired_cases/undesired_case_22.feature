# Features with undesired process outcome
# Strategy: backtrack from undesired outcome of interest

# Feature 22: Special cases that may result in work piece picking failure
Feature: Special cases that may result in work piece picking failure
    - As the Quality Manager,
    - I want a resilient, adaptive process to pick up a work piece with the robot gripper,
    - so production delay is reduced.

    Background:
        Given "the input conveyor" "works well"
        Given "the output conveyor" "works well"
        Given "the robot" with "a gripper" "works well"
        Given "the logistics operator" is "well trained"
        Given "the work piece" in good condition
        Given "the work piece" at "the exit" of "the input conveyor"

    Scenarios: 
        # Scenario 221: Pick up the work piece with challenging condition
        Scenario: Pick up the work piece with challenging condition
            Given "robot gripper positioning" is "inaccurate"
            When "the robot gripper" picks up "the work piece"
            Then "the work piece" is not "picked up" successfully "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 222: Pick up the work piece with challenging condition
        Scenario: Pick up the work piece with challenging condition
            Given "gripper adhesion" to "the work piece" is "insufficient"
            When "the robot gripper" picks up "the work piece"
            Then "the work piece" is not "picked up" successfully "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 223: Pick up the work piece with challenging condition
        Scenario: Pick up the work piece with challenging condition
            Given "environment humidity" is "high"
            When "the robot gripper" picks up "the work piece"
            Then "the work piece" is not "picked up" successfully "in time"
            Then "the system" shall alert "the quality manager"

        # Scenario 224: Pick up the work piece with challenging condition
        Scenario: Pick up the work piece with challenging condition
            Given "the work piece type variation" is "high"
            When "the robot gripper" picks up "the work piece"
            Then "the work piece" is not "picked up" successfully "in time"
            Then "the system" shall alert "the quality manager"