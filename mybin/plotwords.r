words <- read.table('/tmp/words.dat', header=T, sep=' ')
max_y <- max(words$words)
min_y <- min(words$words)
png(filename='/tmp/words.png', height=350, width=500, bg='white')

plot(words$words, type='o', col='green', ylim=c(min_y, max_y), axes=FALSE, ann=FALSE)

# x axis
axis(1, at=1:length(words$day), lab=words$day)
# y axis
axis(2, las=1, at=10*0:max_y)

box()

title(main='Words Written', col.main=rgb(0.2,0.5,0.2), font.main=3)
title(xlab='Days', col.lab=rgb(0,0.5,0))
title(ylab='Count (words)', col.lab=rgb(0,0.5,0))

#abline(h=mean(words$words), col='gray60')
abline(h=mean(words$words), col=2)

dev.off()
