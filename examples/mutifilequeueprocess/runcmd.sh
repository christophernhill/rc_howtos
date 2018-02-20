#!/bin/bash
pwd
sdirs="-B /nfs/cnhlab003/cnh -B /nobackup1b/users/cnh -B /pool001/cnh"
singularity exec ${sdirs} centos7ro.img python -s func.py
