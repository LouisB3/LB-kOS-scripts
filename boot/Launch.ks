Copypath("0:/circularize","1:").
Run once "circularize".

Runpath("0:/preferences").

Print "Launching in 5 seconds.".
Wait 5.
Print "Launch!".
Stage.
Wait 1.
Print "Beginning trajectory...".
Lock desiredPitch to 90 - altitude * 0.0045.
Lock desiredHeading to heading(90,desiredPitch) + R(0,0,270).
Lock steering to desiredHeading.
Lock pitchDifference to vectorangle(facing:forevector,desiredHeading:forevector).
Until altitude > 10000 {
  Print "Alt: " + round(altitude,0) + "m; Target: " + round(desiredPitch,0) + "; Diff: " + round(pitchDifference,2).
  Wait 1.
}.
Print "Continuing trajectory...".
Lock desiredPitch to 45 - (altitude - 10000) * 0.00225.
Until altitude > 30000 {
  Print "Alt: " + round(altitude,0) + "m; Target: " + round(desiredPitch,0) + "; Diff: " + round(pitchDifference,2).
  Wait 1.
}.
Print "Raising apoapsis to 75km...".
Lock steering to heading(90,0) + R(0,0,270).
Wait until apoapsis > 75000.
Print "Suborbit reached.".
Lock throttle to 0.
Print "Switching to prograde.".
Lock steering to r(prograde:pitch,prograde:yaw,facing:roll).
Print "Coasting to circularization...".
Wait until altitude > 70000.
Circularize().
Print "Launch complete.".
Set warp to 0.
SAS on.
