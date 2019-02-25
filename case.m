function mpc = case24()
%IEEERTS24

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100.000000;

%% bus data
% bus_i type           Pd           Qd           Gs           Bs area           Vm           Va       baseKV zone         Vmax         Vmin
mpc.bus = [
      1    2   108.000000    22.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      2    2    97.000000    20.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      3    1   180.000000    37.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      4    1    74.000000    15.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      5    1    71.000000    14.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      6    1   136.000000    28.000000     0.000000  -100.000000    2     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      7    2   125.000000    25.000000     0.000000     0.000000    2     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      8    1   171.000000    35.000000     0.000000     0.000000    2     1.000000     0.000000   138.000000    1     1.050000     0.950000;
      9    1   175.000000    36.000000     0.000000     0.000000    1     1.000000     0.000000   138.000000    1     1.050000     0.950000;
     10    1   195.000000    40.000000     0.000000     0.000000    2     1.000000     0.000000   138.000000    1     1.050000     0.950000;
     11    1     0.000000     0.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     12    1     0.000000     0.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     13    3   265.000000    54.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     14    2   194.000000    39.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     15    2   317.000000    64.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     16    2   100.000000    20.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     17    1     0.000000     0.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     18    2   333.000000    68.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     19    1   181.000000    37.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     20    1   128.000000    26.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     21    2     0.000000     0.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     22    2     0.000000     0.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     23    2     0.000000     0.000000     0.000000     0.000000    3     1.000000     0.000000   230.000000    1     1.050000     0.950000;
     24    1     0.000000     0.000000     0.000000     0.000000    4     1.000000     0.000000   230.000000    1     1.050000     0.950000;
];

% Scale down to weak 1 (86.2), day 1 (93).
mpc.bus(:,3) = mpc.bus(:,3) * 0.86 * 0.93;
mpc.bus(:,4) = mpc.bus(:,4) * 0.86 * 0.93;

% Change the vmax and vmin to avoid voltage-violation at generator buses which controled at 1.05.
mpc.bus(:,12) = 1.06;
mpc.bus(:,13) = 0.94;

%% generator data
%   bus           Pg           Qg         Qmax         Qmin           Vg        mBase status         Pmax         Pmin          Pc1          Pc2       Qc1min       Qc1max       Qc2min       Qc2max     ramp_agc      ramp_10      ramp_30       ramp_q          apf
mpc.gen = [
      1    10.000000     0.000000    10.000000     0.000000     1.035000   100.000000      1    20.000000    16.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      1    10.000000     0.000000    10.000000     0.000000     1.035000   100.000000      1    20.000000    16.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      1   152.000000     0.000000    60.000000   -50.000000     1.035000   100.000000      1   152.000000    30.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      1     0.000000     0.000000     0.000000     0.000000     1.035000   100.000000      1     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      2    10.000000     0.000000    10.000000     0.000000     1.035000   100.000000      1    20.000000    16.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      2    10.000000     0.000000    10.000000     0.000000     1.035000   100.000000      1    20.000000    16.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      2   152.000000     0.000000    60.000000   -50.000000     1.035000   100.000000      1   152.000000    30.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      2     0.000000     0.000000     0.000000     0.000000     1.035000   100.000000      1     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      7    80.000000     0.000000    60.000000     0.000000     1.025000   100.000000      1   100.000000    25.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      7    80.000000     0.000000    60.000000     0.000000     1.025000   100.000000      1   100.000000    25.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
      7    80.000000     0.000000    60.000000     0.000000     1.025000   100.000000      1   100.000000    25.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     13    95.100000     0.000000    80.000000     0.000000     1.020000   100.000000      1   197.000000    69.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     13    95.100000     0.000000    80.000000     0.000000     1.020000   100.000000      1   197.000000    69.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     13    95.100000     0.000000    80.000000     0.000000     1.020000   100.000000      1   197.000000    69.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     14     0.000000    35.300000   200.000000   -50.000000     0.980000   100.000000      1     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15    12.000000     0.000000     6.000000     0.000000     1.014000   100.000000      1    12.000000     2.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15    12.000000     0.000000     6.000000     0.000000     1.014000   100.000000      1    12.000000     2.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15    12.000000     0.000000     6.000000     0.000000     1.014000   100.000000      1    12.000000     2.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15    12.000000     0.000000     6.000000     0.000000     1.014000   100.000000      1    12.000000     2.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15    12.000000     0.000000     6.000000     0.000000     1.014000   100.000000      1    12.000000     2.400000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     15   155.000000     0.000000    80.000000   -50.000000     1.014000   100.000000      1   155.000000    54.300000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     16   155.000000     0.000000    80.000000   -50.000000     1.017000   100.000000      1   155.000000    54.300000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     18   400.000000     0.000000   200.000000   -50.000000     1.050000   100.000000      1   400.000000   100.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     21   400.000000     0.000000   200.000000   -50.000000     1.050000   100.000000      1   400.000000   100.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     22    50.000000     0.000000    16.000000   -10.000000     1.050000   100.000000      1    50.000000    10.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     23   155.000000     0.000000    80.000000   -50.000000     1.050000   100.000000      1   155.000000    54.300000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     23   155.000000     0.000000    80.000000   -50.000000     1.050000   100.000000      1   155.000000    54.300000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
     23   350.000000     0.000000   150.000000   -25.000000     1.050000   100.000000      1   350.000000   140.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
];

% Scale down to weak 1 (86.2), day 1 (93).
mpc.gen(:,2) = mpc.gen(:,2) * 0.86 * 0.93;
mpc.gen(:,3) = mpc.gen(:,3) * 0.86 * 0.93;

%% branch data
%  fbus   tbus            r            x            b        rateA        rateB        rateC        ratio        angle status       angmin       angmax
mpc.branch = [
      1      2     0.002600     0.013900     0.461100   175.000000   250.000000   200.000000     0.000000     0.000000      1  -360.000000   360.000000;
      1      3     0.054600     0.211200     0.057200   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      1      5     0.021800     0.084500     0.022900   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      2      4     0.032800     0.126700     0.034300   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      2      6     0.049700     0.192000     0.052000   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      3      9     0.030800     0.119000     0.032200   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      3     24     0.002300     0.083900     0.000000   400.000000   510.000000   600.000000     1.030000     0.000000      1  -360.000000   360.000000;
      4      9     0.026800     0.103700     0.028100   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      5     10     0.022800     0.088300     0.023900   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      6     10     0.013900     0.060500     2.459000   200.000000   240.000000   250.000000     0.000000     0.000000      1  -360.000000   360.000000;
      7      8     0.015900     0.061400     0.016600   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      8      9     0.042700     0.165100     0.044700   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      8     10     0.042700     0.165100     0.044700   175.000000   208.000000   220.000000     0.000000     0.000000      1  -360.000000   360.000000;
      9     11     0.002300     0.083900     0.000000   400.000000   510.000000   600.000000     1.030000     0.000000      1  -360.000000   360.000000;
      9     12     0.002300     0.083900     0.000000   400.000000   510.000000   600.000000     1.030000     0.000000      1  -360.000000   360.000000;
     10     11     0.002300     0.083900     0.000000   400.000000   510.000000   600.000000     1.020000     0.000000      1  -360.000000   360.000000;
     10     12     0.002300     0.083900     0.000000   400.000000   510.000000   600.000000     1.020000     0.000000      1  -360.000000   360.000000;
     11     13     0.006100     0.047600     0.099900   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     11     14     0.005400     0.041800     0.087900   500.000000   625.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     12     13     0.006100     0.047600     0.099900   500.000000   625.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     12     23     0.012400     0.096600     0.203000   500.000000   625.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     13     23     0.011100     0.086500     0.181800   500.000000   625.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     14     16     0.005000     0.038900     0.081800   500.000000   625.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     15     16     0.002200     0.017300     0.036400   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     15     21     0.006300     0.049000     0.103000   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     15     21     0.006300     0.049000     0.103000   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     15     24     0.006700     0.051900     0.109100   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     16     17     0.003300     0.025900     0.054500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     16     19     0.003000     0.023100     0.048500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     17     18     0.001800     0.014400     0.030300   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     17     22     0.013500     0.105300     0.221200   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     18     21     0.003300     0.025900     0.054500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     18     21     0.003300     0.025900     0.054500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     19     20     0.005100     0.039600     0.083300   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     19     20     0.005100     0.039600     0.083300   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     20     23     0.002800     0.021600     0.045500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     20     23     0.002800     0.021600     0.045500   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
     21     22     0.008700     0.067800     0.142400   500.000000   600.000000   625.000000     0.000000     0.000000      1  -360.000000   360.000000;
];

%%-----  OPF Data  -----%%
%% generator cost data
%  1  startup  shutdown  n  x1  y1  ...  xn  yn
%  2  startup  shutdown  n  c(n-1)  ...  c0
mpc.gencost = [
      2  1500.000000     0.000000      3     0.000000   130.000000   400.684900;
      2  1500.000000     0.000000      3     0.000000   130.000000   400.684900;
      2  1500.000000     0.000000      3     0.014142    16.081100   212.307600;
      2  1500.000000     0.000000      3     0.014142    16.081100   212.307600;
      2  1500.000000     0.000000      3     0.000000   130.000000   400.684900;
      2  1500.000000     0.000000      3     0.000000   130.000000   400.684900;
      2  1500.000000     0.000000      3     0.014142    16.081100   212.307600;
      2  1500.000000     0.000000      3     0.014142    16.081100   212.307600;
      2  1500.000000     0.000000      3     0.052672    43.661500   781.521000;
      2  1500.000000     0.000000      3     0.052672    43.661500   781.521000;
      2  1500.000000     0.000000      3     0.052672    43.661500   781.521000;
      2  1500.000000     0.000000      3     0.007170    48.580400   832.757500;
      2  1500.000000     0.000000      3     0.007170    48.580400   832.757500;
      2  1500.000000     0.000000      3     0.007170    48.580400   832.757500;
      2  1500.000000     0.000000      3     0.000000     0.000000     0.000000;
      2  1500.000000     0.000000      3     0.328412    56.564000    86.385200;
      2  1500.000000     0.000000      3     0.328412    56.564000    86.385200;
      2  1500.000000     0.000000      3     0.328412    56.564000    86.385200;
      2  1500.000000     0.000000      3     0.328412    56.564000    86.385200;
      2  1500.000000     0.000000      3     0.328412    56.564000    86.385200;
      2  1500.000000     0.000000      3     0.008342    12.388300   382.239100;
      2  1500.000000     0.000000      3     0.008342    12.388300   382.239100;
      2  1500.000000     0.000000      3     0.000213     4.423100   395.374900;
      2  1500.000000     0.000000      3     0.000213     4.423100   395.374900;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.000000     0.001000     0.001000;
      2  1500.000000     0.000000      3     0.008342    12.388300   382.239100;
      2  1500.000000     0.000000      3     0.008342    12.388300   382.239100;
      2  1500.000000     0.000000      3     0.004895    11.849500   665.109400;
];