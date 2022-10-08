<h1>AppleWatchRing</h1>

* Hengyu Gu ([Google Scholar](https://scholar.google.com/citations?user=eqYzq68AAAAJ&hl=ja&oi=sra), [ResearchGate](https://www.researchgate.net/profile/Hengyu-Gu)), The Chinese University of Hong Kong <br />

<img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing4.png" width=30% height=30% align="right" />

<p>

<img src="https://img.shields.io/badge/multi-dimensional-ee3437">

<img src="https://img.shields.io/badge/multi-colored-0081c1">

<img src="https://img.shields.io/badge/multi-stratified-9d55a2">
 
 
</p>


------------------------------------------------------------------------

_The AppleWatchRing package focuses on visualizing Apple Watch-type Rings to represent **multidimensional** and **stratified** data._ <br />

## Introduction
 
In migration networks, the **origin-destination (OD)** bilateral flows and each site’s **in- and outflow volumes** are like two sides of the same coin; though popular visualization approaches such as the chord diagram excel in describing the former, the latter mostly remains less depicted aspect. <br />

By applying the Voronoi-based migration **Kaleidoscope diagram** and integrating it with the **sunburst treemap** [(Jahn et al., 2021)](https://github.com/m-jahn/WeightedTreemaps), the function visualizes migration from different time periods and focalizes on the relative status of each migration body as origin or destination. <br />

By attributing different colors to groups and differentiating **in-** and **outflows** with **deep** and **light** shades, information about each body’s weight in the migration network is gained from their size in the diagrams, and variable as well as invariable patterns are observed from the trends. <br />

<p float="center">
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/panel.png" width=18% height=18% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing4.png" width=18% height=18% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing3.png" width=18% height=18% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing2.png" width=18% height=18% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing1.png" width=18% height=18% />
</p>
<p align="center"><i>Deep color for in-migration, light color for out-migration </i><br />
 

## Installation

Use the following code to install from GitHub.

```R
devtools::install_github("PunjabNamaskar/AppleWatchRing",force=TRUE)
```

## Data Format 

The function `AppleWatchRing` takes two types of data, `list` and `threshold`, both as vectors of equal length. The actual radius of each ring depends on the `value` calculated from dividing `list` elements by their `threshold` counterparts (i.e., `1` equals a radius of `2π`).
 
## Usage

The package requires 3 compulsory parameters:
- **list:** the list of attributes that are to be packed together and rendered in comparison, such as the _Move, Exercise, Stand_ scores of real Apple Watch. 
- **threshold:** the threshold or benchmark values for each `list` element to look up to.
- **color:** the hex color codes for representing different rings, should be an _n×2_ vector, with each color pair on the same row being the start and end colors. The up-to-down order corresponds to the inside-out alignment of rings.

as well as 9 optional parameters:
- **seed:** the seed to initiate the Kaleidoscope diagram, for different seeds give rise to different or even zero patterns, depending on the convergence of the state. Some seeds do not generate a diagram at all.
- **title:** the title for the stacked barplots, should be in quotes such as `"xx"`.
- **subtitle:** the subtitle for the stacked barplots, should also be in quotes such as `"xx"`. 
- **error_tol:** the tolerable error rate between the areas of actual polygon and theoretical polygon, with smaller values indicating more accuracy. Default at `0.01`.
- **maxIteration:** the maximum rounds of iteration allowed for the algorithm, with larger values bringing higher possibility of finding convergence. Default at `10000`.
 
 After all parameters are determined, run the following sample(
 palette: <img src="https://img.shields.io/badge/ --787aff">
 <img src="https://img.shields.io/badge/ --00d9ff">
 <img src="https://img.shields.io/badge/ --98fe00">
 <img src="https://img.shields.io/badge/ --fa1250">→
<img src="https://img.shields.io/badge/ --8d8eeb">
 <img src="https://img.shields.io/badge/ --03ffab">
 <img src="https://img.shields.io/badge/ --d7ff01">
 <img src="https://img.shields.io/badge/ --f93986"> ):

```R

AppleWatchRing(list = c(8,7,48,366),
           threshold = c(12,12,30,590),
           color = c("#787aff", "#8d8eeb", 
                     "#00d9ff", "#03ffab", 
                     "#98fe00", "#d7ff01", 
                     "#fa1250", "#f93986"))
```


## Acknowledgements

This package draws much of its inspiration from the interpolation of aesthetics between the start and end points of [ggforce](https://github.com/thomasp85/ggforce/blob/main/R/arc.R), a renowned R package for significant visualizations.
