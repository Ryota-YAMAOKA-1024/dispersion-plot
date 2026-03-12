datafile1 = "/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/00L/E_q_w.txt"


#set title "Ei = 15meV" font "Arial,24"

#for png
# set term png size 800,600
# set out 'q_E.png'
#set size ratio 1  # ratio r = height/width

#for pdf
set term pdfcairo size 18cm,14cm font "Arial,48"
set output '/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/00L/q_E.pdf'

#set xlabel '(1/3,1/3,L) (r. l. u.)' font "Arial,18" # for png
#set ylabel 'E(meV)' font "Arial,18" # for png

set xrange[0:1]
set yrange[0:23]

load '../list.txt'

#SJ1 = 2.0
#ratio = -1
#g_in(x) = cos(2*pi*x) + cos(2*pi*x) + cos(2*pi*2*x)
#g_out(x) = cos(2*pi*x)
#g_out(x) = cos(pi*x)
#G(x) = SJ1 * (((3+2*g_in(0.3333)) + 2*ratio*(-1+g_out(x))) * ((3-g_in(0.3333)) + 2*ratio*(-1+g_out(x)))) ** 0.5


g_in(x) = cos(2*pi*x) + cos(2*pi*x) + cos(2*pi*2*x)
g_out(x) = cos(pi*x)
G(x) = ((SJ1 * (3+2*g_in(0.3333)) + 2 * SJc * (-1+g_out(x))) * (SJ1 * (3-g_in(0.3333)) + 2 * SJc * (-1+g_out(x)))) ** 0.5


set xrange[0:0.5]
#fit G(x) datafile1 u 2:1:3 yerror via SJc
#fit G(x) datafile1 u 2:1:3 yerror via ratio

set xrange[-1:1]

set xtics font "Arial,48" offset 0,0.5
set ytics font "Arial,48"
set bars 0.5

plot datafile1 u 2:1:3:(0.40) w xyerrorbars ls 1 not, G(x) lc rgb "#FF4500" lw 2 t '',\
datafile1 u (-$2):1:3:(0.40) w xyerrorbars ls 1 not