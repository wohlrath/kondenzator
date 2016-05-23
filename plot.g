set terminal pngcairo size 500,500 enhanced
set view map
set output 'a.png'
unset tics
set bmargin 0
set tmargin 0
set lmargin 0
set rmargin 0

set xrange[0:99]
set yrange[0:99]

filename(n)=sprintf("data/naboj%03d.dat",n)

splot 'phi.dat' matrix with image, for [i=1:19] filename(i) u 2:3:(1) ls 1 with lines notitle
