data=[1       -15608          6204    1551    8041   2        -15591          -15596          568     6859    3        -15684          -15653          -748    5731   4        -16052          -15929          -1752   4641   5        -16035          -16040  -2142    3607   6        -16464          -16321          -2250   2603   7        -16596          -16552          -2274   1643   8        -16904          -16801   -2304   715    9        -17185          -17091          -2336   -180   10       -17553          -17430          -2373   -1048  11       -18016  -17861   -2412   -1896  12       -18176          -18122          -2457   -2710  13       -18915          -18668          -2506   -3520  14       -19120  -19051   -2558   -4300  15       -19084          -19096          -2613   -5039  16       -19361          -19268          -2665   -5755  17       -19181  -19241   -2705   -6426  18       -18868          -18972          -2726   -7048  19       -18997          -18954          -2733   -7645  20       -18929  -18951   -2725   -8209  21       -18505          -18646          -2711   -8723  22       -18201          -18302          -2697   -9196  23       -18476  -18384   -2676   -9660  24       -17779          -18011          -2646   -10065         25       -16488          -16918          -2614   -10386         26        -15691          -15956          -2567   -10651         27       -15149          -15329          -2485   -10875         28       -16961          -16357   -2380   -11179         29       -14900          -15587          -2293   -11365         30       -14712          -14774          -2258   -11532 31        -13929          -14190          -2231   -11651         32       -12749          -13142          -2171   -11705         33       -12634          -12672   -2073   -11751         34       -9752   -10712          -1963   -11651         35       -10514          -10260          -1837   -11594         36        -9120   -9584   -1691   -11470         37       -8781   -8894   -1548   -11335         38       -7052   -7628   -1424   -11120         39       -7874    -7600   -1321   -10957         40       -6427   -6909   -1209   -10730         41       -5788   -6001   -1112   -10482         42       -3270   -4109    -1018   -10121         43       -5976   -5074   -913    -9913  44       -4227   -4810   -787    -9628  45       -2426   -3026   -701    -9267  46        -3430   -3095   -645    -8975  47       -2980   -3130   -575    -8675  48       -3375   -3243   -493    -8410  49       -3083   -3180   -452    -8143   50       -2370   -2607   -445    -7854  51       -1777   -1974   -435    -7550  52       -559    -965    -397    -7200  53       132     -21943  -322     -6833  54       751     -21300          -218    -6453  55       1110    990     -104    -6074  56       2269    1882    1       -5656  57       2887     2681    95      -5228  58       4539    3988    196     -4739  59       4402    4447    312     -4281  60       4282    4322    438     -3852  61        3832    3982    540     -3467  62       4018    3956    590     -3092  63       5177    4790    594     -2678  64       5603    5461    596     -2263   65       5467    5512    631     -1876  66       6180    5942    696     -1473  67       7949    7359    764     -1001  68       9106    8720    838      -495   69       9808    9574    951     20     70       9128    9354    1099    475    71       8967    9020    1232    899    72       10059   9695     1304    1357   73       10614   10429   1329    1819   74       10440   10498   1355    2250   75       10631   10567   1410    2669   76       10740    10703   1464    3072   77       11796   11444   1499    3508   78       12034   11954   1529    3934   79       12185   12134   1578    4346   80        12979   12714   1643    4777   81       13092   13054   1706    5192   82       13389   13290   1764    5601   83       13493   13458   1818    5995    84       13790   13691   1864    6384   85       14311   14137   1900    6780   86       14880   14690   1937    7185   87       14599   14692   1982     7555   88       14320   14413   2032    7893   89       13692   13901   2063    8182   90       13840   13790   2060    8464   91       14011   13954    2029    8741   92       14019   14016   1998    9004   93       14264   14182   1986    9267   94       14826   14638   1995    9544   95       15387    15200   2018    9836   96       15271   15309   2057    10107  97       15276   15274   2107    10365  98       14935   15048   2149    10593  99        14964   14954   2166    10811];
index= zeros(1,length(data)/5);
rawdata= zeros(1,length(data)/5);
MAF=zeros(1,length(data)/5);
FIR= zeros(1,length(data)/5);
IIR= zeros(1,length(data)/5);

ii=0;
while ii<=(length(data)/5)-1
    
    index(ii+1)= data(ii*5+1);
    rawdata(ii+1)= data(ii*5+2);
    MAF(ii+1)= data(ii*5+3);
    FIR(ii+1)= data(ii*5+4);
    IIR(ii+1)= data(ii*5+5);
    ii=ii+1;
end

plot(index,rawdata,'k',index,MAF,'-r',index,FIR,'.-b',index,IIR,'.g');
xlabel('sample number');
ylabel('magnitude');
title('Filter Designs');
legend('Raw Data','Moving Avg Filter','Finite Impulse Resp Filter','Infinite Impulse Response Filter');
