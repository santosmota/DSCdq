# Frequency Adaptive Delayed Signal Cancellation Applied Directly to the dq Frames of Dual Current Controllers of Power Converters

This repository contains the simulation and data files used in the manuscript "Simplified Frequency Adaptive Delayed SignalCancellation Applied Directly to the dq Frames ofDual Current Regulators of Power Converters" submmitted to IEEE Power Electronics Letters on August 2021.

Models simulated: MATLAB Version: 9.4.0.949201 (R2018a) Update 6

The main files are organized as follows:

A *_Script.m runs the Simulink Model *.slx and produces a comma separated text file *_Raw.txt.

Figure 1, 2: ShortPulse_Script.m, ShortPulse.slx, ShortPulse_Raw.txt
Figure 3: Equivalency_Script.m, Equivalency.slx, Equivalency_Raw.txt
Figure 4: FreqAdaptiveFFT.m, FreqAdaptiveFFT.slx, FreqAdaptiveFFT_Raw.txt
Figure 5: FreqAdaptive.m, FreqAdaptive.slx, FreqAdaptive.txt

The models use blocks from the library: DSCdq_Library.slx