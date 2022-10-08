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

<p float="left">
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/panel.png" width=15% height=15% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing4.png" width=15% height=15% />
  <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing3.png" width=15% height=15% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing2.png" width=15% height=15% />
 <img src="https://github.com/PunjabNamaskar/AppleWatchRing/blob/main/AppleWatchRing1.png" width=15% height=15% />
</p>
<p align="center"><i>Deep color for in-migration, light color for out-migration </i><br />
 

## Installation

Use the following code to install from GitHub.

```R
devtools::install_github("PunjabNamaskar/AppleWatchRing",force=TRUE)
```

## Data Format 

| h1   | h2              | h3            | color | value       | year      |
| ---- | --------------- | ------------- | ----- | ----------- | --------- |
| East | Beijing 4.23    | Beijing-in    | 1     | 3.827759959 | 2005-2010 |
| East | Tianjin 1.71    | Tianjin-in    | 1     | 1.49712     | 2005-2010 |
| East | Hebei 2.94      | Hebei-in      | 1     | 0.924089997 | 2005-2010 |
| East | Shandong 3.35   | Shandong-in   | 1     | 1.335580002 | 2005-2010 |
| East | Jiangsu 6.78    | Jiangsu-in    | 1     | 4.887289935 | 2005-2010 |
...
| East | Beijing 4.23    | Beijing-out   | 2     | 0.405949995 | 2005-2010 |
| East | Tianjin 1.71    | Tianjin-out   | 2     | 0.213359999 | 2005-2010 |
| East | Hebei 2.94      | Hebei-out     | 2     | 2.017390001 | 2005-2010 |
| East | Shandong 3.35   | Shandong-out  | 2     | 2.014989985 | 2005-2010 |
| East | Jiangsu 6.78    | Jiangsu-out   | 2     | 1.893540001 | 2005-2010 |
...
 
 - **The hierarchies:** The hierarchies are named `h1`, `h2` ... etc., note that the level to be labeled should also contain label texts, for example, `"Beijing 4.23"` serves both as the second level indicator and a label string. Meanwhile, the lowest level should end with `"-in"` and `"-out"`.
 - **The color:** A numeric series starting from `1`, should be in accordance with the `-in` and `-out` series. The color column should be sorted in ascending order.
 - **The value:** Values defining the cells' and labels' sizes.
 - **The year:** Year for the time series.
 
## Usage

The package requires 4 compulsory parameters:
- **data_name:** the name of the csv file for data input that has been described above, such as `"xx.csv"`. 
- **label_level:** the level of the hierarchical data to be used for labeling, such as `2`.
- **color_palette_original:** the hex color codes for representing different groups of data, should be half length of the labeled level, such as `c("#ee3437","#0081c1","#9d55a2","#0bae57")`. The other half of light colors will be generated then.
- **year:** the year selected to present the data, should be one of the `year` column elements such as `"2010-2015"`.<br />

as well as 5 optional parameters:
- **seed:** the seed to initiate the Kaleidoscope diagram, for different seeds give rise to different or even zero patterns, depending on the convergence of the state. Some seeds do not generate a diagram at all.
- **title:** the title for the stacked barplots, should be in quotes such as `"xx"`.
- **subtitle:** the subtitle for the stacked barplots, should also be in quotes such as `"xx"`. 
- **error_tol:** the tolerable error rate between the areas of actual polygon and theoretical polygon, with smaller values indicating more accuracy. Default at `0.01`.
- **maxIteration:** the maximum rounds of iteration allowed for the algorithm, with larger values bringing higher possibility of finding convergence. Default at `10000`.
 
 After all parameters are determined, run the following codes with sample data 1 
 (
 palette: <img src="https://img.shields.io/badge/ --ee3437">
 <img src="https://img.shields.io/badge/ --0081c1">
 <img src="https://img.shields.io/badge/ --9d55a2">
 <img src="https://img.shields.io/badge/ --0bae57">
 ):

```R

AppleWatchRing(list = c(8,7,48,366),
           threshold = c(12,12,30,590),
           color = c("#787aff", "#8d8eeb", 
                     "#00d9ff", "#03ffab", 
                     "#98fe00", "#d7ff01", 
                     "#fa1250", "#f93986"))
```


## Acknowledgements

This package relies greatly on the seminal work of [Michael Jahn, David Leslie and Ahmadou Dicko (2021)](https://github.com/m-jahn/WeightedTreemaps) which makes possible the creation of voronoi and sunburst treemaps. Based on their original version of treemaps, this package integrated voronoi and sunburst diagrams as well as attached circular labels to better illustrate the values of each component. We would like to extend our genuine gratitude to their generous contribution and devotion.
