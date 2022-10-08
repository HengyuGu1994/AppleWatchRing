# Define AppleWatchRing function
AppleWatchRing <- function(list, threshold, color, 
                       radius, thickness, size,
                       shadow_ring_end, shadow_ring_edge,
                       alpha_ring_end, alpha_ring_edge,
                       alpha_bottom_color, alpha_bottom_shadow) {
  
  if(missing(radius)){
    radius=0.5
  }
  
  if(missing(thickness)){
    thickness=0.8
  }
  
  if(missing(size)){
    size=20
  }
  
  if(missing(shadow_ring_end)){
    shadow_ring_end=0.2
  }
  
  if(missing(shadow_ring_edge)){
    shadow_ring_edge=0.05
  }
  
  if(missing(alpha_ring_end)){
    alpha_ring_end=0.2
  }
  
  if(missing(alpha_ring_edge)){
    alpha_ring_edge=0.2
  }
  
  if(missing(alpha_bottom_color)){
    alpha_bottom_color=0.01
  }
  
  if(missing(alpha_bottom_shadow)){
    alpha_bottom_shadow=0.01
  }
  
  
  # Libraries
  library(ggraph)
  library(igraph)
  library(tidyverse)
  library(viridis)
  library(ggforce)
  library(ggplot2)
  library(cowplot)
  library(magick)
  library(dplyr)
  library(tidyr)
  library(grid)
  options(warn=-1, scipen=999)
  
  # Let's make some data
  value = list / threshold *2*pi
  
  arcs <- data.frame(
    start = 0,
    end = value,
    pi = 2*pi,
    r = radius + seq(thickness, length(value)*thickness, thickness)
  )
  
  # The 2 version allows interpolation of aesthetics between the start
  # and end points
  arcs2 <- data.frame(
    angle = c(arcs$start, arcs$end),
    pi = c(arcs$start, arcs$pi),
    r = rep(arcs$r, 2),
    group = c(1:length(value)),
    colour = paste("a",c(seq(1,length(value)*2-1,2), seq(2,length(value)*2,2)))
  )
  
  arcs2$pi_lower <- arcs2$pi
  
  arcs2$pi[arcs2$angle < 2*pi] <- 
    arcs2$angle[arcs2$angle < 2*pi]
  
  arcs2$bottom = arcs2$pi_lower
  arcs2$lower_shadow <- arcs2$pi+shadow_ring_end/arcs2$r
  arcs2$lower_color <- arcs2$pi
  arcs2$upper_shadow[arcs2$angle < 2*pi] <- 
    0
  arcs2$upper_shadow[arcs2$angle > 2*pi] <- 
    arcs2$angle[arcs2$angle > 2*pi]-
    2*pi+shadow_ring_end/arcs2$r[arcs2$angle > 2*pi]
  arcs2$upper_color[arcs2$angle < 2*pi] <- 
    arcs2$angle[arcs2$angle < 2*pi]
  arcs2$upper_color[arcs2$angle > 2*pi] <- 
    arcs2$angle[arcs2$angle > 2*pi]-2*pi
  
  arcs2$colour2 = arcs2$colour
  rev_colour <- rep(NA, 0)
  for (i in unique(arcs2$r)) {
    arcs2_order = arcs2[order(arcs2$r),]
    colour = (arcs2_order %>% filter (arcs2_order$r == i))$colour2
    rev_colour <- append(rev_colour, rev(colour))
  }
  arcs2_order$colour2 = rev_colour
  arcs2 = arcs2_order[order(arcs2_order$angle),]
  
  p <- ggplot(arcs2) +
    scale_color_manual(values=color) + 
    # Bottom color layer
    geom_arc2(aes(x0 = 0, y0 = 0, r = r, 
                  end = bottom, group = group,
                  colour = colour), 
              size = size, alpha = alpha_bottom_color, 
              lineend = 'round') + 
    # Bottom shadow layer
    geom_arc2(aes(x0 = 0, y0 = 0, r = r, 
                  end = bottom, group = group,
                  colour = colour), 
              size = size, alpha = alpha_bottom_shadow, 
              lineend = 'round', color = "black") + 
    # Lower shadow layer 
    geom_arc2(aes(x0 = shadow_ring_edge, y0 = 0, r = r, 
                  end = lower_shadow, group = group,
                  colour = colour), 
              size = size, alpha = alpha_ring_edge, 
              lineend = 'round', color = "black") +
    # Lower color layer
    geom_arc2(aes(x0 = 0, y0 = 0, r = r, 
                  end = lower_color, group = group,
                  colour = colour), 
              size = size, 
              lineend = 'round') +
    # Upper shadow layer
    geom_arc2(aes(x0 = 0, y0 = 0, r = r, 
                  end = upper_shadow, group = group,
                  colour = colour), 
              size = size, alpha = alpha_ring_end,
              lineend = 'round', color = "black") +
    # Upper color layer
    geom_arc2(aes(x0 = 0, y0 = 0, r = r, 
                  end = upper_color, group = group,
                  colour = colour2), 
              size = size, 
              lineend = 'round') +
    theme(axis.line=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(),
          legend.position="none",
          panel.background = element_rect(fill = "transparent",
                                          color = NA),
          panel.border=element_blank(),
          panel.grid.minor = element_line(color = NA),
          panel.grid.major = element_line(color = NA),
          plot.background = element_rect(fill='transparent', 
                                         color=NA)
    ) 
  
  ggsave(plot = p, bg = "transparent",
         filename = "AppleWatchRing.pdf")
  
}
