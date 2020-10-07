#Ls="0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9"
#Rs="50 100 200 350"
Ls="1.0"
Rs="50"
time=4850.99900
seed=1

for r in $Rs; do
	for l in $Ls; do
	    gnuplot -e "set terminal png; plot [1:1000][4400:5000] 'R${r}_l${l}_seed${seed}.out' u 2:1:3 with image" > R${r}_l${l}_seed${seed}_plot1.png

	    python changefile.py R${r}_l${l}_seed${seed}.out $time
	    #mv plotfile.txt ./R${r}_l${l}.txt
	    gnuplot -e "set terminal png; plot 'R${r}_l${l}_seed${seed}.txt' u 2:3 pointtype 7" > R${r}_l${l}_seed${seed}_plot2.png
	    gnuplot -e "set terminal png; plot 'R${r}_l${l}_seed${seed}.txt' u 2:4 pointtype 7" > R${r}_l${l}_seed${seed}_plot3.png
	done 
done
R350_l1.0_seed1.out

python changefile.py R350_l1.0_seed1.out 4850.99900

gnuplot -e "set terminal png; plot 'R350_l1.0_seed1.txt' u 2:3 pointtype 7" > R${r}_l${l}_seed${seed}_plot2.png
gnuplot -e "set terminal png; plot 'R350_l1.0_seed1.txt' u 2:4 pointtype 7" > R${r}_l${l}_seed${seed}_plot3.png
