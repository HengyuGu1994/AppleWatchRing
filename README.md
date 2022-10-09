<h1>AppleWatchRing</h1>

* Hengyu Gu ([Google Scholar](https://scholar.google.com/citations?user=eqYzq68AAAAJ&hl=ja&oi=sra), [ResearchGate](https://www.researchgate.net/profile/Hengyu-Gu)), The Chinese University of Hong Kong <br />

<img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing4.png" width=30% height=30% align="right" />

<p>

<img src="https://img.shields.io/badge/multi-dimensional-fa1250">

<img src="https://img.shields.io/badge/multi-colored-98fe00">

<img src="https://img.shields.io/badge/multi-phased-00d9ff">

<img src="https://img.shields.io/badge/benchmarked-data-787aff">
 
 
</p>


------------------------------------------------------------------------

_The AppleWatchRing package focuses on visualizing Apple Watch-style Rings to represent **multidimensional** and **benchmarked** data._ <br />

## Introduction
 
The Apple Watch™ diagram is originally an intuitional visualization of multilevel physical attributes, ranging from the fundamental aspects of human activities to additional items that are of concern. The package makes use of the idea and develops a visualization technique that inherits the patterns but extends it to higher dimensions and broader prospects. <br />

It is capable of quantifying various types of data based on the same means of measurement (the radius of rings) while disregarding the differences in scales, units and specialties. Each attribute is set with a threshold or benchmark value against which intragroup comparisons can be facilitated. Once the benchmark value is attained, a cycle appears on the diagram (or in their words, [Close Your Rings](https://www.apple.com/watch/close-your-rings/)). <br />

It is also worthwhile that an intergroup comparison may be feasible by juxtaposing two Apple Watch-style ring sets, when their own strenghs, weaknesses and balances will be easily visible. Whether it be vertical or horizontal comparison, the _AppleWatchRing_ package can serve its purpose on a lot of occasions. <br />
<br />
<p float="center">
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/panel.png" width=18% height=18% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing4.png" width=18% height=18% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing3.png" width=18% height=18% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing2.png" width=18% height=18% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing1.png" width=18% height=18% />
</p>
<p align="center"><i>There can be customized number of rings</i><br />
<br />
<img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/black.png" />

<p align="center"><i>It works with black backgrounds, too</i><br />

## Installation

Use the following code to install from GitHub.

```R
devtools::install_github("HengyuGu1994/AppleWatchRing",force=TRUE)
```

## Data Format 

The function `AppleWatchRing` takes two types of data, `list` and `threshold`, both as vectors of equal length. The actual radius of each ring depends on the `value` calculated from dividing `list` elements by their `threshold` counterparts (i.e., `1` equals a radius of `2π`).
 
## Usage

The package requires 3 compulsory parameters:
- **list:** the list of attributes that are to be packed together and rendered in comparison, such as the _Move, Exercise, Stand_ scores of real Apple Watch™. 
- **threshold:** the threshold or benchmark values for each `list` element to look up to.
- **color:** the hex codes for representing color interpolation within different rings, should be an _n×2_ vector, with each horinzontal color pair being the start and end colors. The up-to-down order corresponds to the inside-out alignment of rings.

as well as 9 optional parameters:
- **radius:** the radius of empty space in the middle of the diagram, defalt at `0.5`. 
- **thickness:** the thickness of ring gaps, with a smaller value indicating a more compact alignment, default at `0.8`.
- **size:** the size of the diagram, default at `20`.
- **shadow_ring_end:** the size of shadow at the end of each ring, default at `0.2`.
- **shadow_ring_end:** the size of shadow on the edge of each ring, default at `0.05`.
- **alpha_ring_end:** the alpha transparency of shadow at the end of each ring, default at `0.2`.
- **alpha_ring_edge:** the alpha transparency of shadow on the edge of each ring, default at `0.2`.
- **alpha_bottom_color:** the alpha transparency of bottom color underneath each ring, default at `0.01`.
- **alpha_bottom_shadow:** the alpha transparency of bottom shadow underneath each ring, default at `0.01`.
 
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
