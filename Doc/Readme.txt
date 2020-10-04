************************************************************
* author: Sixuan Wang
* data: 2012/Nov/01
* title: MacaquePathogenTransmission_Cell-DEVS
************************************************************

1. Please unzip the file firstly, anywhere.

Documentations are in the "MacaquePathogenTransmission/Doc" directory.
it contains the report and reference paper.

2. In order to run the scripts, import the project in CD++

3. To test the Macaque Pathogen Transmission model...

  1) Go to the "Macaque Pathogen Transmission" directory

  2) Edit "Pathogen.ma" to change the size of the 
     cell space and other interesting parameters

  3) Edit "Pathogen.val" to change the initial values, especially
     landscape and temple values.

  3) Edit "Pathogen.inc" to change the macro parameters

  4) Run Pathogen _test_run.bat to generate the 
     log file

  5) Run TIS_test_drw.bat to generate the 
     drw file

4. The three tests described in the report can be found in the "Macaque Pathogen Transmission/Test" 
directory. You can copy and paste to your test project. Each test has the following files...

  * "pathogen.ma"     model file
  * "pathogen.val"     inital val file
  * "pathogen.inc"     model parameters
  * "pathogen.pal"     palette file
  * "pathogen.log"     results log file
  * "pathogen.drw"     processed results
  * "pathogen.bat" script to run simulation
  * "pathogen_drw.bat" script to process results

