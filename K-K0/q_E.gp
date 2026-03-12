#datafile = 'E_q_w_q1q2.txt'
datafile = '/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/K-K0/E_q_w.txt'


#set title "Ei = 15meV" font "Arial,30"

#for pdf
set term pdfcairo size 18cm,14cm font "Arial,48"
set output '/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/K-K0/q_E.pdf'
set size ratio 0.7  # ratio r = height/width
#set size 0.9,0.9
#set origin 0.05,0.05

#set xlabel '(1/3+K,1/3-K,0) (r. l. u.)' font "Arial,24" # for pdf
#set ylabel 'E (meV) ' font "Arial,24" # for pdf



set xrange[0:1]
set yrange[0:6.5]

set xtics font "Arial,48"
set ytics font "Arial,48"
set xtics offset 0,0.5          # bring x labels closer while avoiding overlap
set bars 0.5                    # shrink error-bar caps (default is 1.0 character height)

load '../list.txt'

g_in(x) = cos(2*pi*(0.3333+x)) + cos(2*pi*(0.3333-x)) + cos(2*pi*0.6667)
#g_in(x) = cos(2*pi*(x)) + cos(2*pi*(-x)) + cos(2*pi*0)
g_out(x) = cos(2*pi*x)
G(x) = ((SJ1 * (3+2*g_in(x)) + 2 * SJc * (-1+g_out(0))) * (SJ1 * (3-g_in(x)) + 2 * SJc * (-1+g_out(0)))) ** 0.5

#fit [0:0.3333] G(x) datafile u 2:1:3 yerror via SJ1

set xrange[-1:1]
plot datafile u 2:1:3:(0.25) w xyerrorbars ls 1 not, G(x) lc rgb "#00BFFF" lw 2 t '',\
datafile u (-$2):1:3:(0.25) w xyerrorbars ls 1 not

unset output