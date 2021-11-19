This simple app (based on
[this](https://shiny.rstudio.com/gallery/tabsets.html) Shiny demo)
highlights the current (version 0.4.0, 2021-11-19) behavior of ggboxplot
(in [ggpubr](https://github.com/kassambara/ggpubr)), which calls
`set.seed(123)` each time it is used. This resets the random number
generator (RNG), resulting in subsequent random numbers being identical to
those already generated.

To see this, leave the "Set seed before getting samples?" radio button on
"No", and change the number of observations. The data (coming from a call
to `rnorm`, shown beneath the box plot) will always have the same initial
values.

If you change "Set seed before getting samples?" to "Yes", the RNG seed is
set prior to each call to get a new dataset to get around ggboxplot setting
the seed to the constant `123` value each time it is used. The data are
then different on each sample, as would be expected.

There is a GitHub issue
[here](https://github.com/kassambara/ggpubr/issues/177) to (hopefully)
change this behavior.

The code for this app can be found
[here](https://github.com/terrycojones/ggboxplot-random-seed-demo).
