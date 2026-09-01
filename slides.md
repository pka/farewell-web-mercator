% Interactive web mapping with Equal Earth projection
% Pirmin Kalberer @implgeo
% FOSS4G 2026 Hiroshima
---
width: 1600
height: 900
---

# About me

GIS developer @ Sourcepole, Switzerland

Web GIS, QGIS and other OSGeo projects

t-rex tile server -> BBOX server

::: notes
OSM:
. . .
Lazy mapper (55 changesets in 15 years)
. . .
FOSSGIS e.V. board (German OSM chapter)
. . .
:::

# The current state of Web Mapping

. . .

* Web Mercator projection
* Sometimes a globe

![](images/maplibre-native-android.jpg)


# Web Mercator - the bad parts

## Size distortion

![](images/mercator-size-distortion-animated.gif)

Africa actually has 14 times as much area as Greenland

::: notes
Image credit: https://en.wikipedia.org/wiki/Mercator_projection
:::

## Thematic mapping

![](images/webmercator-osm-membership.png)

## In the wild

![](images/webmercator-skynews.jpg)

::: notes
On T-shirts, posters and even in school rooms
Image credit: https://mapstodon.space/@luis_de_sousa@mastodon.social/113540237357844184
:::

# Mercator projection

![](images/mercator-portrait.jpg)

* Gerardus Mercator, 1569
* Conformal cylindrical map projection
* Good for navigation

::: notes
* north everywhere "up" and south "down", while preserving local directions and shapes
* 1512 (Flanders) - 1594 (Duisburg)
<https://en.wikipedia.org/wiki/Gerardus_Mercator>
:::

## Web Mercator

* Mercator projection cropped to ~85°N to 85°S
  -> square, good for tiling
* Spherical and ellipsoidal mix of formulas

::: notes
The value 85.051129° is the latitude at which the full projected map becomes a square
:::

# Equal Earth map projection

Bojan Šavrič, Tom Patterson, Bernhard Jenny, 2018

<https://www.equal-earth.com/>

::: notes
Inspired by the Robinson projection, retains the relative size of areas.
:::

## Equal Earth Greenwich

![](images/Equal-Earth-Map-0.jpg)

EPSG:8857

## Equal Earth Americas

![](images/Equal-Earth-Map-90W.jpg)

EPSG:8858

## Equal Earth Asia-Pacific

![](images/Equal-Earth-Map-150E.jpg)

EPSG:8859

## Equal Earth Florence

![](images/Equal-Earth-Map-11E.jpg)

Florence Meridian 11E

# Behaviour for interactive maps

Two proposals

## Dynamic center meridian

![](images/equal-earth-rotation.gif)

[Interactive example (OpenLayers)](https://openlayers.org/en/latest/examples/equal-earth-geojson.html)

::: notes

Reproject WGS-84-Tiles?

<https://observablehq.com/d/ece4d307c72c1312>
:::

## Use Mercator for higher zoom levels

![](images/Equal-Earth-Maplibre.jpg)
![](images/NE-combined-Merc.jpg)

* World view: Equal earth
* Regional view: Mercator

::: notes
<https://equal.bbox.earth/maplibre-eq2merc/>
:::

## Challenges: Antimeridian problems

![](images/antimerdian-qgis.png)

Solutions:

* Prepare data (split at potential antimeridians)
* Improve rendering algorithms

## Smooth transition Equal Earth -> Mercator

![](images/proj-transition.gif)

Example: MapLibre globe

::: notes
<https://kvaleya.gitlab.io/maplibre/globe/globedemo.html>
:::

# Software support

## Projection

* PROJ -> GDAL, QGIS, R
* proj4js
* D3

## OpenLayers

* Projection support for raster and vector data
* Reprojection of vector tiles
* Support for non-Mercator grids

::: notes
Dynamic projection demo: https://ahocevar.net/fossgis-2026/14
:::

## MapLibre

* Single tile grid
* Globe view reprojected from Mercator tiles
* In development: Equal earth view reprojected from Mercator tiles!

::: notes
![](images/Equal-Earth-Maplibre.jpg)

<https://equal.bbox.earth/maplibre/>
:::

## Ways to support Equal Earth

* Use data in Equal Earth projection
  * Which tile grids?
  * PoC SotM EU 2024: Equal Earth projected data in Mercator grid
* Reproject data from WGS84 (or Mercator?)

## How can you help?

* Sponsor development
* Call out bad maps and spread the word
* Use Equal Earth for world maps

# Thank you

Pirmin Kalberer

[mapstodon.space/@implgeo](https://mapstodon.space/@implgeo)

<pka@sourcepole.com>
