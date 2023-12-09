# MT_Force_Spindle
Public codes for Chu et al.,

For the analysis of the microtubule shapes:

analyze_buckling.m - loads an example of the digitised microtubules shapes from sample_data.txt and calculates and plots curvatures of the microtubule for the selected frames. These curvatures are saved to variables F and G.

Anylize_all_shapes.m - extracts data from F and G and plots it for all traces


For the Cytosim simulations

Cytosim should be installed from here: https://gitlab.com/f.nedelec/cytosim/-/blob/master/doc/compile/index.md

Cytosim_Parameters.txt contains an example of parameters for for the Cytosim run


