# OSVVM Practice

Make sure to download the OSVVM instructions for this to work
- [OSVVM Documentation](https://github.com/osvvm/OSVVM-Scripts#readme)

The purpose of this repo is to practice OSVVM, and create good test cases. I used the counter module, as its a beginner friendly VHDL project, and easy to validate. 

# How to run
First, make sure to download both ModelSim (can be the starter version), and OSVVM using the documentation. The order is as follows. Create a project, and import all three of the files that are in this repository. 

1. Clone the OSVVM repository:

```bash
git clone --recursive https://github.com/osvvm/OsvvmLibraries
```

2. Source the startup script:

```tcl
source <path-to-OsvvmLibraries>/OsvvmLibraries/Scripts/StartUp.tcl
```

3. Build the OSVVM libraries:

```tcl
build ../OsvvmLibraries
```

4. Run the demo tests:

```tcl

build ../OsvvmLibraries/RunDemoTests.pro
```

I would highly encourage using ModelSim, as I tried using Vivado for OSVVM, and the setup was incredibly painful, and I still didn't get it to pass all eleven tests.

A big issue that I ran into was that the osvvm library was installed on my computer, but the path was not set in ModelSim. In ModelSim, there is a libraries tab, and scroll all the way down to OSVVM or osvvm. If there is no path there, add the path to the osvvm or OSVVM folder. It should be located in the VHDL_LIBS directory. 

If all of the demos run correctly, great! You are ready to run my test script. It is an 8 bit rotating counter, with test cases of Reset_Test, Count_Test, and Overflow_Test. 

To run the script, run the following command. Make sure you have sourced to the StartUp.tcl script, and have the files counter.vhd, counter_tb.vhd, and buildCounter.pro. 

The buildCounter.pro file is a script that will be used to run the program. Try running the program by calling the following command in the TCL command line. 

```tcl

build buildCounter.pro
```

After this has been ran, many tabs will open up, but just wait until you see something along the lines of PASSED: 1 FAILED: 0. The path to the log file is also found there, and open up the .HTML file. There should be an OSVVM webpage, with all tests passing, hopefully. 

Congratulations! You have now ran my OSVVM script. 
