# MT_Force_Spindle
Public codes for Chu et al.,

For the analysis of the microtubule shapes:

analyze_buckling.m - loads an example of the digitised microtubules shapes from sample_data.txt and calculates and plots curvatures of the microtubule for the selected frames. These curvatures are saved to variables F and G.

Anylize_all_shapes.m - extracts data from F and G and plots it for all traces

C-TRAP force cruve export.ipynb - extract time, distance between beads and force from C-Trap data recording

C-TRAP pushing pulling force duration finder.ipynb - find positive, negative and zero force data segments in C-trap data

Measuring 3D spindle pole-toploe Distance.txt - macro for measuring spindle pole to pole distance from confocal z-stack images using imagej

For the Cytosim simulations:

Cytosim should be installed from here: https://gitlab.com/f.nedelec/cytosim/-/blob/master/doc/compile/index.md

config.cym.tpl contains an example used for a single cytosim run. 

sub.sh, batch.sh and report.sh are the scripts used to run a single job, a batch of jobs and report output correspondingly. 

Instructions:

To generate the configuration files (with 5 repeats for each motor ratio condition):
> python preconfig.py config.cym.tpl 32

This command generates 50 configuration files (named in_vitro_config_0000.cym to in_vitro_config_0049.cym).

To execute the batch.sh bash script:
> bash batch.sh


