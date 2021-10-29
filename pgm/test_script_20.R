##20.General function in ggplot2

library(ggplot2)
install.packages("stat_quantile")

##test for qplot, last_plot and ggsave

qplot(x = cty, y = hwy, data = mpg, geom = "point")
ggplot(data = mpg, aes(x = cty, y = displ))+geom_point()

p=last_plot()
p
ggsave("plot.png", width = 5, height = 5)


##GRAPHICAL PRIMITIVES

a <- ggplot(economics, aes(date, unemploy))
b <- ggplot(seals, aes(x = long, y = lat))

a + geom_blank()
b + geom_curve(aes(yend = lat + 1, xend=long+1),curvature=1)
a + geom_path(lineend="butt", linejoin="round", linemitre = 1)
b + geom_rect(aes(xmin = long, ymin=lat, xmax= long + 1, ymax = lat + 1))
a + geom_ribbon(aes(ymin=unemploy - 900, ymax=unemploy + 900))

##create data frame for testing geom_polygon
d=data.frame(x=c(1,2,2, 3,4,4), y=c(1,1,2, 2,2,3), t=c('a', 'a', 'a',  'b', 'b', 'b'), r=c(1,2,3, 4,5,6))
ggplot() +
  geom_polygon(data=d, mapping=aes(x=x, y=y, group=t))

  
  
##LINE SEGMENTS
b <- ggplot(seals, aes(x = long, y = lat))

b + geom_abline(aes(intercept=0, slope=1))
b + geom_hline(aes(yintercept = lat))
b + geom_vline(aes(xintercept = long))

b + geom_segment(aes(yend=lat+1, xend=long+1))
b + geom_spoke(aes(angle = 1:1155, radius = 1))


##ONE VARIABLE continuous
c <- ggplot(mpg, aes(hwy))
c2 <- ggplot(mpg)

c + geom_area(stat = "bin", bins=40)
c + geom_density(kernel = "gaussian")
c + geom_dotplot(binwidth = 0.5)
c + geom_freqpoly(binwidth = 0.5)
c + geom_histogram(binwidth = 5)
c2 + geom_qq(aes(sample = hwy))

###discrete
d <- ggplot(mpg, aes(fl))
d + geom_bar()


##TWO VARIABLES
###continuous x , continuous y
e <- ggplot(mpg, aes(cty, hwy))
e + geom_label(aes(label = cty), nudge_x = 1, nudge_y = 1)
e + geom_jitter(height = 2, width = 2) 
e + geom_point()
e + geom_rug(sides = "bl")
e + geom_smooth(method = lm)
e + geom_text(aes(label = cty), nudge_x = 1, nudge_y = 1, check_overlap = TRUE)

###discrete x , continuous y
f <- ggplot(mpg, aes(class, hwy))
f + geom_col()
f + geom_boxplot()
f + geom_dotplot(binaxis = "y", stackdir = "center", binwidth = 1)
f + geom_violin(scale = "area")

###discrete x , discrete y
g <- ggplot(diamonds, aes(cut, color))
g + geom_count()

###continuous bivariate distribution
h <- ggplot(diamonds, aes(carat, price))
h + geom_bin2d(binwidth = c(0.25, 500))
h + geom_density2d()
h + geom_hex()

###continuous function
i <- ggplot(economics, aes(date, unemploy))
i + geom_area()
i + geom_line()
i + geom_step(direction = "hv")

###visualizing error
df <- data.frame(grp = c("A", "B"), fit = 4:5, se = 1:2)
j <- ggplot(df, aes(grp, fit, ymin = fit-se, ymax = fit+se))
j + geom_crossbar(fatten = 2)
j + geom_errorbar()
j + geom_linerange()
j + geom_pointrange()

###maps
#install.packages("maps")
#library(maps)
data <- data.frame(murder = USArrests$Murder,
                   state = tolower(rownames(USArrests)))
map <- map_data("state")
k <- ggplot(data, aes(fill = murder))
k + geom_map(aes(map_id = state), map = map) + 
  expand_limits(x = map$long, y = map$lat)


###THREE VARIABLES
seals$z <- with(seals, sqrt(delta_long^2 + delta_lat^2))
l <- ggplot(seals, aes(long, lat))
l + geom_contour(aes(z = z))
l + geom_raster(aes(fill = z), hjust=0.5, vjust=0.5, interpolate = FALSE)
l + geom_tile(aes(fill = z))


##Stats
i <- ggplot(economics, aes(date, unemploy))
i + stat_density2d(aes(fill = ..level..), 
                   geom = "polygon")

c <- ggplot(mpg, aes(hwy))
c + stat_bin(binwidth = 1)
c + stat_count(width = 1)
c + stat_density(adjust = 1, kernel = "gaussian")

e <- ggplot(mpg, aes(cty, hwy))
e + stat_bin_2d(bins = 30, drop = T)
e + stat_bin_hex(bins=30)
e + stat_density_2d(contour = TRUE, n = 100)
e + stat_ellipse(level = 0.95, segments = 51, type = "t")
e + stat_ecdf(n = 40)
e + stat_smooth(method = "lm", formula = y ~ x, se=T, level=0.95)
e + stat_identity()
e + stat_sum()
e + stat_unique()

##Stats continued
#install.packages("Hmisc")
#install.packages("Formula")
library(Hmisc)
e + stat_summary(fun.data = "mean_cl_boot")

#install.packages("quantreg")
#install.packages("SparseM")
library(quantreg)
e + stat_quantile(quantiles = c(0.1, 0.9), formula = y ~ log(x), method = "rq")



l <- ggplot(seals, aes(long, lat))
l + stat_contour(aes(z = z))
l + stat_summary_hex(aes(z = z), bins = 30, fun = max)
l + stat_summary_2d(aes(z = z), bins = 30, fun = mean)

f <- ggplot(mpg, aes(class, hwy))
f + stat_boxplot(coef = 1.5)
f + stat_ydensity(kernel = "gaussian", scale = "area")

ggplot(data.frame(x = -3:3), aes(x)) + stat_function(fun = 
                           dnorm, args = list(sd=0.5))

h <- ggplot(diamonds, aes(carat, price))
h + stat_summary_bin(fun = "mean", geom = "bar")


##Scales
d <- ggplot(mpg, aes(fl))
(n <- d + geom_bar(aes(fill = fl)))
n + scale_fill_manual(
  values = c("skyblue", "royalblue", "blue", "navy"),
  limits = c("d", "e", "p", "r"), breaks =c("d", "e", "p", "r"),
  name = "fuel", labels = c("D", "E", "P", "R"))


###GENERAL PURPOSE SCALES

####test for scale_*_continuous
p1 <- ggplot(mpg, aes(displ, hwy)) +geom_point()

p1 +
  scale_x_continuous(breaks = c(2, 4, 6),
                     label = c("two", "four", "six")) +
  scale_y_continuous("Highway MPG")


####test for scale_*_discrete
(p2 <- ggplot(subset(diamonds, carat > 1), aes(cut, clarity)) +
    geom_jitter())
p2 +
  scale_x_discrete("Cut",
      labels = c(
      "Fair" = "F",
      "Good" = "G",
      "Very Good" = "VG",
      "Perfect" = "P",
      "Ideal" = "I"))


####test for scale_*_identity
ggplot(mtcars, aes(mpg, wt)) +
  geom_point(aes(size = cyl)) +
  scale_size_identity()


####test for scale_*_manual
ggplot(mtcars,
  aes(mpg, wt, colour = factor(cyl), fill = factor(cyl))) +
  geom_point(shape = 21, alpha = 0.5, size = 2) +
  scale_colour_manual(
    values = c("8" = "red", "4" = "blue", "6" = "orange"),
    aesthetics = c("colour", "fill")
  )


####test for scale_*_date
p3 <- ggplot(data = economics, aes(x = date, y = psavert)) + 
  geom_line(color = "steelblue")

#----- Set axis limits c(min, max)
min <- as.Date("2002-1-1")
max <- NA
p3 + scale_x_date(limits = c(min, max))


####test for scale_*_datetime
dates <- as.POSIXct(as.Date("2011/01/01") + sample(0:365, 100, replace=TRUE))
times <- as.POSIXct(runif(100, 0, 24*60*60), origin="2011/01/01")

df <- data.frame(
  dates = dates,
  times = times)

library(scales)
ggplot(df, aes(x=dates, y=times)) + 
  geom_point() + 
  scale_y_datetime(breaks=date_breaks("4 hour"), labels=date_format("%H:%M")) + 
  theme(axis.text.x=element_text(angle=90))




###X & Y LOCATION SCALES

require(MASS) # to access Animals data sets
require(scales) # to access break formatting functions
data(Animals) # load data

# x and y axis are transformed and formatted
ggplot(Animals, aes(x = body, y = brain)) + geom_point() +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x)))


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()+                        
  scale_y_reverse()


###COLOR AND FILL SCALES (DISCRETE)
d <- ggplot(mpg, aes(fl))
n <- d + geom_bar(aes(fill = fl))
n + scale_fill_brewer(palette = "Blues")
n + scale_fill_grey(start = 0.2, end = 0.8, 
                    na.value = "red")



###COLOR AND FILL SCALES (CONTINUOUS)

c <- ggplot(mpg, aes(hwy))
o <- c + geom_dotplot(aes(fill = ..x..))
o + scale_fill_distiller(palette = "Blues")
o + scale_fill_gradient(low="red", high="yellow")
o + scale_fill_gradient2(low="red", high="blue", mid = "white", midpoint = 25) 
o + scale_fill_gradientn(colours=topo.colors(6))



###SHAPE AND SIZE SCALES
e <- ggplot(mpg, aes(cty, hwy))
p <- e + geom_point(aes(shape = fl, size = cyl))
p + scale_shape() + scale_size()
p + scale_shape_manual(values = c(3:7))
p + scale_radius(range = c(1,6))
p + scale_size_area(max_size = 6)




##Coordinate Systems
d <- ggplot(mpg, aes(fl))
r <- d + geom_bar()
r + coord_cartesian(xlim = c(0, 5))
r + coord_fixed(ratio = 1/2)
r + coord_flip()
r + coord_polar(theta = "x", direction=1 )


##Position Adjustments
s <- ggplot(mpg, aes(fl, fill = drv))
s + geom_bar(position = "dodge")

s + geom_bar(position = "fill")
s + geom_bar(position = "stack")
s + geom_bar(position = position_dodge(width = 1))

e <- ggplot(mpg, aes(cty, hwy))
e + geom_point(position = "jitter")

ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars)))+geom_label(position = "nudge")



##Themes
d <- ggplot(mpg, aes(fl))
r <- d + geom_bar()
r + theme_bw()

r + theme_gray()

r + theme_dark()

r + theme_classic()
r + theme_light()
r + theme_linedraw()
r + theme_minimal()
r + theme_void()


##Faceting
t <- ggplot(mpg, aes(cty, hwy)) + geom_point()
t + facet_grid(cols = vars(fl))
t + facet_grid(rows = vars(year))
t + facet_grid(rows = vars(year), cols = vars(fl))
t + facet_wrap(vars(fl))
t + facet_grid(rows = vars(drv), cols = vars(fl), 
               scales = "free")
t + facet_grid(cols = vars(fl), labeller = label_both)
t + facet_grid(rows = vars(fl), 
               labeller = label_bquote(alpha ^ .(fl)))


##Labels
t <- ggplot(mpg, aes(cty, hwy)) + geom_point()
t + labs( x = "New x axis label", y = "New y axis label",
          title ="Add a title above the plot", 
          subtitle = "Add a subtitle below title",
          caption = "Add a caption below plot") 
t + annotate(geom = "text", x = 25, y = 20, label = "A", color='red')


##Legends

n <- d + geom_bar(aes(fill = fl))
n + theme(legend.position = "bottom")
n + guides(fill = "none")
n + scale_fill_discrete(name = "Title", labels = c("A", "B", "C", "D", "E"))


##Zooming

t <- ggplot(mpg, aes(cty, hwy)) + geom_point()

t + coord_cartesian(
  xlim = c(0, 100), ylim = c(10, 20))
t + xlim(0, 100) + ylim(10, 20)
t + scale_x_continuous(limits = c(0, 100)) +
    scale_y_continuous(limits = c(0, 100))




