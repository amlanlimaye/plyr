## Practice for DSO 545 quiz 1

attach(BOD)
ggplot(BOD, aes(x = factor(Time), y = demand, group = 1)) +
        geom_line() +
        xlab("Time") +
        ylim(c(0,20))

library(plyr)
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length= (mean(len)))
tg

ggplot(tg, aes(x = factor(dose), y = length, color = supp, group = supp)) +
        geom_line()

ggplot(tg, aes(x = factor(dose), y = length, group = supp)) +
        geom_line() +
        geom_point(size = 4, aes(shape = supp))

pts = data.frame(x = 1:25, y = rep(10, 25))
attach(pts)
ggplot(pts, aes(x = factor(x), y = y)) +
        geom_point(shape = pts$x, size = 4)

ggplot(tg, aes(x = factor(dose), y = length, shape = supp, group = supp)) +
        geom_line(position = position_dodge(0.2)) +
        geom_point(position = position_dodge(0.2), size = 4)

sunspot_df = data.frame( year = as.numeric(time(sunspot.year)),
                         sunspots = as.numeric(sunspot.year))

ggplot(sunspot_df, aes(x = year, y = sunspots)) +
        geom_area(alpha = .2)

ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) + geom_area()

ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
        geom_area(color = "black", size = 0.2, alpha = 0.4) +
        scale_fill_brewer(palette = "Reds", breaks = rev(levels(uspopage$AgeGroup))) +
        ylab("Population Size (in thousands)")

uspopage_prop <- ddply(uspopage, "Year", transform,
                       Percent = Thousands /sum(Thousands) * 100)


head(uspopage_prop$Percent)
ggplot(uspopage_prop, aes(x = Year, y = Percent, fill = AgeGroup)) +
        geom_area(alpha = 0.8) +
        scale_fill_brewer(palette = "Blues", breaks = rev(levels(uspopage$AgeGroup)))

