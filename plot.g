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

splot 'phi.dat' matrix with image

set output 'b.png'

set xtics
set ytics

unset bmargin 
unset tmargin 
unset lmargin
unset rmargin 

plot 'naboj.dat' u 2:3 notitle

set terminal wxt