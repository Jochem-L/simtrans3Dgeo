# simtrans3Dgeo
Estimate the parameters of 3D similarity transformation (Helmert) in Matlab / Octave using the Geodetic Transformations Toolbox with geographical coordinates as input and a PROJ4 string / PROJ pipeline as output.

* Download and Install [Matlab](https://nl.mathworks.com/products/matlab.html) (commercial sorftare) or [Octave](https://octave.org/) (free software)
* Download the [Geodetic Transformations Toolbox](https://nl.mathworks.com/matlabcentral/fileexchange/9696-geodetic-transformations) by Peter Wasmeier ([license](https://nl.mathworks.com/matlabcentral/mlc-downloads/downloads/e54f1263-4a80-11e4-9553-005056977bd0/29f0e5c0-aa0a-456e-9259-c14162e5bda0/license/license.txt))
* Download simtrans3Dgeo.m (and if you are using Octave also pad.m) from this repository
* Create a script like Krayenhoff2ETRS89eersteorde.m with your input and run it
* Identify and deselect outliers in the residuals and re-run the script
* Copy the PROJ4 string (e.g. for a custom CRS in [QGIS](https://qgis.org/)) or the PROJ pipeline (e.g. for transformation with cct in [PROJ](https://proj.org/)) from the output 

