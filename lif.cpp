#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <iomanip>
#include <string>
#include <cstring>
using namespace std;

double mydouble(double threshold) {
        return threshold*((double)rand()/(double)RAND_MAX);
}

int mod(int a, int b)
{
    int r = a % b;
    return r < 0 ? r + b : r;
}

int main(int argc,char *argv[]){

        string N1 = argv[4];
        int N = atoi(argv[4]);
        string R1 = argv[1];
        int R = atoi(argv[1]);
        int wth = 200;
        int nstep = 1000;
        int it = 0;
        int seed_array [4] = {395849566, 63789869, 572907421, 749107355};
        string seed1 = argv[5];
        int seed = seed_array[atoi(argv[5])-1];

        double dt=0.001;
        double pi=3.14159265;
        string l1 = argv[2];
        double l = atof(argv[2]);
        double uth=0.98;
        double m = 1.0;
        string s1 = argv[3];
        double s = atof(argv[3]);
        double sim_time = 5000.0;

        double u[N], unext[N], cycles[N];

        int sign = atoi(argv[6]);
        string strr = "R" + R1 + "_l" + l1 + "_s" + s1 + "_N" +N1 + "_seed" + seed1 + ".out";

        ofstream outfile (strr.c_str());

        srand(seed);
        for(int i=0;i<N;i++){
                // initialization with random numbers
                u[i] = mydouble(uth);
                cycles[i] = 0.0;
                //outfile<< 0.0 <<"\t"<<i<<"\t"<<u[i]<< 0.0 <<"\n";
        }

        for(double time=0; time<=sim_time; time = time + dt){
                it++;

                for(int i = 0; i<N; i++){
                        // create the sum in ring
                        double sum = 0.0;

                        for(int j = 1 ; j<=R; j++){
                                int aristeros = mod(i-j,N); // we need module not reminder in case it's negative
                                int dexis = ((i+j) % N);

                                sum += u[aristeros] + u[dexis] - 2*u[i]; // u[j] - u[i] for 2 neighbors
                        }

                        unext[i] = u[i] + dt*(m - l*u[i] + sign*(s/(2*R))*sum);
                }

                for(int i=0; i<N; i++){

                        // discharge and compute cycles

                        if(unext[i] > uth) {
                                u[i] = 0.0;
                                if (it > wth) cycles[i] += 1.0;
                        }
                        else u[i] = unext[i];

                        // print results
                        if (it%nstep==0){
                                outfile << fixed << setprecision(5) <<time<< "\t" <<i<< "\t" << u[i]<< "\t" << (2.0*pi*cycles[i]/(time-dt*wth)) << endl;
                        }
                }

        }
}
                                                                                        