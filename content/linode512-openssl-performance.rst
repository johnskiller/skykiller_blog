linode512 openssl performance
#############################
:date: 2012-03-19 11:05
:author: john
:category: linux
:slug: linode512-openssl-performance

| OpenSSL 0.9.8o 01 Jun 2010
|  built on: Thu Feb 10 20:02:37 UTC 2011
|  options:bn(64,32) md2(int) rc4(idx,int) des(ptr,risc1,16,long)
|  aes(partial) blowfish(idx)
|  compiler: gcc -fPIC -DOPENSSL\_PIC -DZLIB -DOPENSSL\_THREADS
|  -D\_REENTRANT -DDSO\_DLFCN -DHAVE\_DLFCN\_H -DL\_ENDIAN -DTERMIO -O3
|  -march=i686 -Wa,--noexecstack -g -Wall -DOPENSSL\_BN\_ASM\_PART\_WORDS
|  -DOPENSSL\_IA32\_SSE2 -DSHA1\_ASM -DMD5\_ASM -DRMD160\_ASM -DAES\_ASM
|  available timing options: TIMES TIMEB HZ=100 [sysconf value]
|  timing function used: times
|  The 'numbers' are in 1000s of bytes per second processed.

::

    type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
    md2               1111.16k     2358.19k     3020.20k     3482.97k     3465.22k
    mdc2                 0.00         0.00         0.00         0.00         0.00 
    md4              22889.25k    91362.07k   240970.75k   445882.71k   596669.78k
    md5              21355.02k    68243.58k   190466.99k   295882.07k   367184.55k
    hmac(md5)        19581.87k    64380.24k   174561.45k   314281.30k   386588.67k
    sha1             20708.70k    60001.73k   142597.63k   214354.26k   259287.72k
    rmd160           12445.10k    34347.48k    61032.45k    87747.24k    95297.54k
    rc4             241504.99k   266422.87k   241990.91k   242539.86k   244763.31k
    des cbc          45638.82k    51675.80k    51744.68k    50136.41k    50090.95k
    des ede3         17488.60k    18787.01k    17345.71k    17180.60k    15564.80k
    idea cbc             0.00         0.00         0.00         0.00         0.00 
    seed cbc             0.00         0.00         0.00         0.00         0.00 
    rc2 cbc          21084.94k    22638.19k    22209.11k    21743.96k    22044.67k
    rc5-32/12 cbc        0.00         0.00         0.00         0.00         0.00 
    blowfish cbc     76885.90k    81148.00k    81156.10k    77797.72k    82643.63k
    cast cbc         48770.16k    51143.34k    48810.92k    50297.17k    50189.65k
    aes-128 cbc      52170.21k    89064.66k   108961.88k   113282.73k   112762.88k
    aes-192 cbc      54572.73k    73673.75k    86437.08k    93029.38k    97577.64k
    aes-256 cbc      47864.41k    67428.03k    79630.59k    79793.83k    79140.18k
    camellia-128 cbc        0.00         0.00         0.00         0.00         0.00 
    camellia-192 cbc        0.00         0.00         0.00         0.00         0.00 
    camellia-256 cbc        0.00         0.00         0.00         0.00         0.00 
    sha256           11873.65k    27703.10k    45966.76k    56730.97k    61287.08k
    sha512            9399.14k    39709.72k    67339.95k   104067.75k   123805.70k
    aes-128 ige      90179.69k    97617.13k    99146.41k   102565.21k   103833.60k
    aes-192 ige      76513.25k    85180.93k    83190.44k    85140.14k    86106.11k
    aes-256 ige      70858.75k    77512.58k    77123.41k    77456.04k    77914.11k
                      sign    verify    sign/s verify/s
    rsa  512 bits 0.000505s 0.000038s   1980.4  26552.3
    rsa 1024 bits 0.002218s 0.000096s    451.0  10417.3
    rsa 2048 bits 0.011587s 0.000288s     86.3   3466.8
    rsa 4096 bits 0.070915s 0.000912s     14.1   1096.2
                      sign    verify    sign/s verify/s
    dsa  512 bits 0.000385s 0.000442s   2595.2   2264.6
    dsa 1024 bits 0.000966s 0.001193s   1035.1    838.3
    dsa 2048 bits 0.002945s 0.003605s    339.5    277.4

