# Nationwide transformation of coordinates in the Bonne projection used for historical map series of the Netherlands
Jochem Lesparre, Nederlandse Samenwerking Geodetische Infrastructuur ([NSGI](https://www.nsgi.nl/))

## Introduction
The historical map series of the Netherlands the *Topografische en Militaire Kaart (TMK)* and the *Chromotopografische Kaart des Rijks* (*Bonnebladen*) use geographic coordinates from Krayenhoff’s triangulation and coordinates in the Bonne projection. The older *Choro-topographische kaart der Noordelijke Provinciën van het Koningrijk der Nederlanden* by Krayenhoff is based on the same triangulation, but used geographic coordinates with a different geoid and a different projection. While a locally optimised transformation (e.g. rubbersheeting) will give the best results for georeferencing the Dutch historical map series based on the Bonne projection, a nationwide coordinate transformation can be useful. There are 2 options for this transformation:

1. Original polynomial transformation from Bonne coordinas to RD coordinates
2. Approximate similarity transformation from Bonne coordinates to ETRS89

The original transformation is a third degree polynomial transformation published in 1925.<sup>[[Van Riel 1925](https://dehollandsecirkel.courant.nu/periodicals/TKL/1925)]</sup> It is based on a subset of 21 points from the 64 first-order triangulation points that Krayenhoff's triangulation<sup>[[Krayenhoff 1850]()]</sup> and the Rijksdriehoeksmeting (RD)<sup>[[Heuvelink 1920]()]</sup> had incommon.

The approximate transformation introduced in this document, is based on a least-squares estimation using 102 common points with coordinates in the Bonne projection as well as RDNAP coordinates. The points are a subset, evenly distributed over the Netherlands, obtained from the original transformation (*Tafel van Van Riel*). To reduce the size of the rotation angles of the similarity transformation, the longitude of the prime meridian is set to the value 4°&nbsp;53′&nbsp;1.978″ E of Greenwich from RD.<sup>[[Haasbroek 1972](https://ncgeo.nl/downloads/16Haasbroek.pdf)]</sup> For original geographic Krayenhoff coordinates, the prime meridian of Amsterdam should be set to zero. 

The residuals of the approximate similarity transformation reach up to 6 m and show a whirly pattern that is typical for the inaccuracies of a triangulation. For the original polynomial transformation, the residuals are smaller. However, the pattern and magnitude of the residuals are only representative for high-order triangulated points. The deviations of topographic features in the historical maps can be much larger (e.g. RMSE of 74 m for a sample of 32 points in the municipality Dieren)<sup>[[Van Riel 1925](https://dehollandsecirkel.courant.nu/periodicals/TKL/1925)]</sup> for both transformations.

The parameters of the Dutch Bonne projection are listed in several historical sources.<sup>[[Add older source]()] [[Van der Schraaf 1979](https://ncgeo.nl/downloads/23VanDerSchraaf.pdf)]</sup> Some sources also provide lists of points with coordinates in Bonne projection as well as geographic Krayenhoff coordinates,<sup>[[Topografisch Bureau 1864](https://www.google.nl/search?q=Meetkunstige+beschrijving+van+het+Koningrijk+der+Nederlanden&tbm=bks)]</sup> with errors up to 5 m due to the numeric inaccuracy of historical computation methods like slide rulers.

## Implementation using open scource library PROJ
The recommended open source library is PROJ version 7 or newer. Commands for the cct program of PROJ are given. A PROJ4-style string is provided too.

### 1. Original polynomial transformation from Dutch Bonne coordinates to RD
PROJ pipeline for the original third degree polynomial (Horner) transformation from coordinates in Dutch Bonne projection to RD (EPSG:28992), e.g. for use in cct of PROJ:
```
cct -d 4 -z 0 +proj=pipeline
+step +proj=horner +deg=3 +fwd_origin=0,0 +fwd_u=+120025.8705,+0.999986846,-0.0250515e-8,+0.1471965e-14,+0.006918172,-0.0860518e-8,-0.0398590e-14,+0.0011249e-8,+0.4556545e-14,+0.1991105e-14 +fwd_v=+390181.7849,+0.999993024,-0.0338879e-8,+0.1184845e-14,-0.006907254,-0.0492600e-8,-0.1945916e-14,+0.0222878e-8,+0.9244571e-14,-0.1091684e-14 +inv_tolerance=0.0001
```

For transformation to ETRS89 or WGS 84, additional steps of the transformation RDNAPTRANS™ should be added.<sup>[[NSGI](https://www.nsgi.nl/)]</sup>

### 2. Approximate similarity transformation from Dutch Bonne coordinates to ETRS89 
#### 2.1 PROJ pipeline
PROJ pipeline for an approximate 7-parameter similarity (Helmert) transformation from coordinates in Dutch Bonne projection to ETRS89, e.g. for use in cct of PROJ:

```
cct -d 9 -z 0 +proj=pipeline 
+step +proj=bonne +lat_1=51.5 +lon_0=0 +a=6376950.4 +rf=309.65 +pm=4.883882778 +inv 
+step +proj=cart +a=6376950.4 +rf=309.65
+step +proj=helmert +convention=coordinate_frame +exact +x=932.9862 +y=86.2986 +z=-197.9356 +rx=2.276813 +ry=1.478043 +rz=4.673555 +s=50.09450 
+step +proj=cart +ellps=GRS80 +inv
```

For transformation to RD, additional steps of the transformation RDNAPTRANS™ should be added.<sup>[[NSGI](https://www.nsgi.nl/)]</sup> For transformation to WGS 84, no additional steps are needed if a null transformation is used, as recommended for most applications.<sup>[[Geonovum](https://docs.geostandaarden.nl/crs/crs/)]</sup> 

#### 2.2 PROJ4-style string
PROJ4-style string for an an approximate 7-parameter similarity (Helmert) transformation from coordinates in Dutch Bonne projection to ETRS89, e.g. for defining a custom CRS in QGIS: 
```
+proj=bonne +lat_1=51.5 +lon_0=0 +a=6376950.4 +rf=309.65 +pm=4.883882778 +towgs84=932.9862,86.2986,-197.9356,-2.276813,-1.478043,-4.673555,50.09450 +type=crs
```

NB: A null transformation between ETRS89 and WGS84 is used, as recommended for most applications.<sup>[[Geonovum](https://docs.geostandaarden.nl/crs/crs/)]</sup> 

For transformation to RD, an additional PROJ4 string is needed for RDNAPTRANS™.<sup>[[NSGI](https://www.nsgi.nl/)]</sup>

