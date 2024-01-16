# Nation-wide transformation of geographic coordinates from Krayenhoff’s triangulation and coordinates in the Bonne projection used for historical map series of the Netherlands
The historical map series of the Netherlands the *Topografische en Militaire Kaart (TMK)* and the *Chromotopografische Kaart des Rijks (Bonnebladen)* use geographic coordinates from Krayenhoff’s triangulation and coordinates in the Bonne projection. The older *Choro-topographische kaart der Noordelijke Provinciën van het Koningrijk der Nederlanden* by Krayenhoff used geographic coordinates with a different geoid and a different projection. While a locally optimised transformation will give the best results for georeferencing the Dutch historical map series based on the Bonne projection, a nationwide coordinate transformation can be useful. There are 3 options for this transformation:

1. Original 'official' transformation from Bonne coordinas to RD coordinates
2. Approximate transformation from Bonne coordinates to ETRS89 / WGS84 as PROJ pipeline
3. Approximate transformation from Bonne coordinates to ETRS89 / WGS84 as PROJ4-style string

The parameters of the approximate transformation are based on a least-squares estimation using 102 common points with coordinates in the Bonne projection as well as RDNAP coordinates, evenly distributed over the Netherlands from the original 'official' transformation (*Tafel van Van Riel*). The residuals for the approximate 7-parameter transformation reach up to 6 m and show a whirly pattern that is typical for the inaccuracies of a triangulation. For the original 'official' polynomial transformation, the residuals are smaller. However, the pattern and magnitude of the residuals are only representative for high-order triangulated points. The deviations of topographic features in the historical maps can be much larger, [[Van Riel 1925](https://dehollandsecirkel.courant.nu/periodicals/TKL/1925)] gives an example of an RMSE of 74 m for a sample of 32 points in the municipality Dieren and 28 m for 5 sample points in the province Noord-Brabant.

NB: The longitude for the prime meridian of 4° 53′ 1.978″ E of Greenwich from [[Haasbroek 1972](https://ncgeo.nl/downloads/16Haasbroek.pdf)] is mainly used to reduce the size of the rotation angles of the 7-parameter transformation. For original geographic Krayenhoff coordinates, the parameter for the prime meridian of Amsterdam should be set to zero (`+pm=0`). The parameters of the projection are listed in several historical sources, e.g. [[Schraaf 1979](https://ncgeo.nl/downloads/23VanDerSchraaf.pdf)]. Some sources also provide lists of points with coordinates in Bonne projection as well as geographic Krayenhoff coordinates, e.g. [[Topografisch Bureau 1864](https://www.google.nl/search?q=Meetkunstige+beschrijving+van+het+Koningrijk+der+Nederlanden&tbm=bks)] with errors up to 5 m due to the numeric inaccuracy of historical computation methods like mechanical calculators.

## 1. Original 'official' transformation from Bonne coordinates to RD coordinates
PROJ pipeline for the original 'official' polynomial (Horner) transformation by [[Van Riel 1925](https://dehollandsecirkel.courant.nu/periodicals/TKL/1925)] from Dutch Bonne projection to RD (EPSG:28992) for use in cct of PROJ:
```
cct -d 4 -z 0 +proj=pipeline
+step +proj=horner +deg=3 +fwd_origin=0,0 +fwd_u=+120025.8705,+0.999986846,-0.0250515e-8,+0.1471965e-14,+0.006918172,-0.0860518e-8,-0.0398590e-14,+0.0011249e-8,+0.4556545e-14,+0.1991105e-14 +fwd_v=+390181.7849,+0.999993024,-0.0338879e-8,+0.1184845e-14,-0.006907254,-0.0492600e-8,-0.1945916e-14,+0.0222878e-8,+0.9244571e-14,-0.1091684e-14 +inv_tolerance=0.0001
```

## 2. Approximate transformation from Bonne coordinates to ETRS89 / WGS84 as PROJ pipeline
PROJ pipeline for an approximate 7-parameter (Helmert) transformation from Dutch Bonne projection to ETRS89 / WGS84 for use in cct of PROJ:

```
cct -d 9 -z 0 +proj=pipeline 
+step +proj=bonne +lat_1=51.5 +lon_0=0 +a=6376950.4 +rf=309.65 +pm=4.883882778 +inv 
+step +proj=cart +a=6376950.4 +rf=309.65
+step +proj=helmert +convention=coordinate_frame +exact +x=932.9862 +y=86.2986 +z=-197.9356 +rx=2.276813 +ry=1.478043 +rz=4.673555 +s=50.09450 
+step +proj=cart +ellps=GRS80 +inv
```

## 3. Approximate transformation from Bonne coordinates to ETRS89 / WGS84 as PROJ4-style string:
PROJ4-style string for an an approximate 7-parameter (Helmert) transformation from Dutch Bonne projection to ETRS89 / WGS84 for defining a custom CRS in QGIS: 
```
+proj=bonne +lat_1=51.5 +lon_0=0 +a=6376950.4 +rf=309.65 +pm=4.883882778 +towgs84=932.9862,86.2986,-197.9356,-2.276813,-1.478043,-4.673555,50.09450 +type=crs
```
