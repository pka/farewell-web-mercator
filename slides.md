% Farewell Web Mercator
% Pirmin Kalberer @implgeo
% State of the Map Europe 2024 Łódź
---
width: 1600
height: 900
---

# About me

. . .

Lazy mapper (55 changesets in 15 years)

. . .

FOSSGIS e.V. board (German OSM chapter)

. . .

GIS developer

* Sourcepole, Switzerland
* t-rex tile server -> BBOX

# Web Mercator in the wild

##

![](images/webmercator-osm-membership.png)

::: notes
Bad for thematic mapping
:::

##

![](images/webmercator-relief.jpg)

::: notes
Africa actually has 14 times as much area as Greenland
:::

##

![](images/xkcd-greenland_size.png)

<https://xkcd.com/2911>

::: notes
<https://www.explainxkcd.com/wiki/index.php/2911:_Greenland_Size>
:::

##

![](images/xkcd-bad_map_projection_the_greenland_special.png)


# Mercator projection

![](images/mercator-portrait.jpg)

* Gerardus Mercator, 1596
* Conformal cylindrical map projection
* Good for navigation

::: notes
* north everywhere "up" and south "down", while preserving local directions and shapes
* 1512 (Flanders) - 1594 (Duisburg)
<https://en.wikipedia.org/wiki/Gerardus_Mercator>
:::

## Web Mercator

* Mercator projection cropped to around 85°N to 85°S
  -> square, good for tiling
* Spherical and ellipsoidal mix of formulas

::: notes
The value 85.051129° is the latitude at which the full projected map becomes a square
:::

# Alternatives

##

![](images/ortelius-1572.jpg)

Theatrum Orbis Terrarum, 1572

::: notes
Cartographer Abraham Ortelius issues Theatrum Orbis Terrarum, the first modern atlas.

Three Latin editions of this (besides a Dutch, a French and a German edition) appeared before the end of 1572; 25 editions came out before Ortelius' death in 1598; and several others were published subsequently, for the atlas continued to be in demand till about 1612. It is often considered as the official beginning of the Golden Age of Netherlandish cartography (~1570s–1670s).
:::

##

![](images/xkcd-map_projections.png)

##

![](images/tweet-gmaps-globe-2018.png)

::: notes

2018

:::

##

![](images/mastodon-benschmidt-gmaps.png)

##

![](images/equal-earth-etopo1.jpg)

# Equal Earth map projection

Bojan Šavrič, Tom Patterson, Bernhard Jenny, 2018

<https://www.equal-earth.com/>

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

## Support

* PROJ -> Desktop GIS
* D3, Plotly, R, ... 
* proj4

# Web mapping

Equal Earth already in use
by cartographers

. . .

Limitations:

* Limited zooming  
* Variable center meridian
* Tile caching

## Tile grid

![](images/grid-unscaled.jpg)

::: notes
A quadratic grid for Equal Earth centered on Greenwich is similar to a Web Mercator grid.
Instead of Mercator grid corners at +/-20'037'508 the grid corners of Equal Earth 
Greenwich are at +/-17'243'959
:::

## Scaled grid

![](images/grid-scaled.jpg)

::: notes
scale factor of 1.162. Conversions between geographic WGS84 coordinates and the map coordinate reference 
system give wrong results without adapted calculations.
But maps can be displayed without any coordinate projection calculations.
:::

## MapLibre

<https://equal.bbox.earth/maplibre/>

Web Mercator grid

## OpenLayers

<https://equal.bbox.earth/ol-asia-pacific/>

Equal Earth Asia-Pacific, Web Mercator grid

## DeckGL

<https://equal.bbox.earth/deckgl/>

MapLibre map with DeckGL layer using Web Mercator tile grid.

## Proposal: Combined projections

<https://equal.bbox.earth/maplibre-eq2merc/>

Equal Earth tiles at z0-z2 and Web Mercator tiles with z >= 3.

## OSM basemap with combined projections

<https://maps.bbox.earth/>

MapLibre with Shortbread PMTiles.

# Possible improvements

## Animated transition z2 -> z3

  <https://kvaleya.gitlab.io/maplibre/globe/globedemo.html>

## Dynamic center meridian

![](images/equal-earth-rotation.gif)

<https://observablehq.com/d/ece4d307c72c1312>

Reproject WGS-84-Tiles?

## Coordinate transformation

Plugins for MapLibre, OpenLayers, etc.
with coordinate transformation functions.

Adapted zoom functions between z < 3 and z >= 3.

# Summary

Say farewell to Web Mercator

(on world scale)

and use Equal Earth instead.

# Thank you

Pirmin Kalberer

<https://mapstodon.space/@implgeo>