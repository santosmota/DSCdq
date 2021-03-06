# Frequency Adaptive Delayed Signal Cancellation Applied Directly to the Rotating Reference Frames of Dual-Sequence Current Controllers of Power Converters

This repository contains the simulation and data files used in the manuscript "Simplified Frequency Adaptive Delayed Signal Cancellation Applied Directly in the Rotating Reference Frame" submitted to IEEE Power Electronics Letters on August 2021.

MATLAB Version: 9.4.0.949201 (R2018a) Update 6

The files are organized as follows:

 - The "\*_Script.m" runs the Simulink Model "\*.slx".
 - The Simulink Model "\*.slx" produces a comma separated text file "\*_Raw.txt".
 - The comma separated text file "\*_Raw.txt" contains the data necessary for generating the figures.
 
Scripts and models fore each figure in the manuscript:

- Figure 1, 2: ShortPulse_Script.m, ShortPulse.slx, ShortPulse_Raw.txt
- Figure 3: Equivalency_Script.m, Equivalency.slx, Equivalency_Raw.txt
- Figure 4: FreqAdaptiveFFT.m, FreqAdaptiveFFT.slx, FreqAdaptiveFFT_Raw.txt
- Figure 5: FreqAdaptive.m, FreqAdaptive.slx, FreqAdaptive.txt

All Simulink models use blocks from the library "DSCdq_Library.slx".
