#!/bin/bash
curl https://graphics.stanford.edu/data/voldata/mrbrain-8bit.tar.gz > mrbrain-8bit.tar.gz
tar -xzvf  mrbrain-8bit.tar.gz
fpref=mrbrain-8bit045

odir=${fpref}_split_dir
mkdir ${odir}
echo "tifftopnm --byrow ${fpref}.tif "'>'" ${fpref}.pnm"
ilo=0
jlo=0
ihi=255
jhi=255
wi=64
wj=64
oli=4
olj=4
left=0
top=0
while [ $top  -lt $jhi ]; do
while [ $left -lt $ihi ]; do
 # Calc x extents
 lv=$((left-oli))
 if [ $lv -lt 0 ] 
 then 
   lv=0 
 fi
 wx=$((wi+oli*2))
 if [ $lv -eq 0 ]
 then 
  wx=$((wi+oli))
 fi
 ex=$((lv+wx))
 if [ $ex -gt $ihi ]
 then
  wx=$((wi+oli))
 fi
 # Calc y extents
 tv=$((top-olj))
 if [ $tv -lt 0 ] 
 then 
   tv=0 
 fi
 wy=$((wj+olj*2))
 if [ $tv -eq 0 ]
 then 
  wy=$((wj+olj))
 fi
 ey=$((tv+wy))
 if [ $ey -gt $jhi ]
 then 
  wy=$((wj+olj))
 fi
 foutpref="${fpref}-${tv},${lv}_${wy},${wx}"
 echo "pamcut " $tv $lv $wy $wx ${fpref}.pnm ' > ' "${odir}/${foutpref}.pnm"
# pnmtotiff mrbrain-8bit045-1,1.pnm > mrbrain-8bit045-1,1.tiff
 echo "pnmtotiff ${foutpref}.pnm "'>'" ${odir}/${foutpref}.tiff"
 left=$((left+wi))
done
left=0
top=$((top +wj))
done
