#datafile = 'E_q_w.txt'
datafile = '/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/HH0/E_q_w_q1q2.txt'


#set title "Ei = 15meV" font "Arial,30"

#for pdf
set term pdfcairo size 18cm,14cm font "Arial,48"
set output '/Users/yamaokaryota/Documents/Projects/UTokyo/Nakajima-Lab/US-exp/workspace/HRC/dispersion-plot/HH0/q_E.pdf'
set size ratio 0.7  # ratio r = height/width
#set size 0.9,0.9
#set origin 0.05,0.05

#set xlabel '(H,H,0) (r. l. u.)' font "Arial,24" # for png
#set ylabel 'E (meV) ' font "Arial,24" # for png



set xrange[0:1]
set yrange[0:8]

set xtics font "Arial,48"
set ytics font "Arial,48"
set xtics offset 0,0.5          # bring x labels closer while avoiding overlap
set bars 0.5                    # shrink error-bar caps (default is 1.0 character height)


load '../list.txt'

g_in(x) = cos(2*pi*x) + cos(2*pi*x) + cos(2*pi*2*x)
g_out(x) = cos(pi*x)
G(x) = ((SJ1 * (3+2*g_in(x)) + 2 * SJc * (-1+g_out(0))) * (SJ1 * (3-g_in(x)) + 2 * SJc * (-1+g_out(0)))) ** 0.5


set xrange[0.3333:0.5]
#fit G(x) datafile u ($2+0.3333):1:3 yerror via SJ1

set xrange[0:1]
plot datafile u ($2+0.3333):1:3:(0.25) w xyerrorbars lt 1 not, G(x) lc rgb "#00BFFF" lw 2 t '',\
datafile u (0.3333-$2):1:3:(0.25) w xyerrorbars lt 1 not