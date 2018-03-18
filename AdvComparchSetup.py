#!/usr/bin/env python3

################################################################################
#                                                                              #
#   Filename    : AdvComparchSetup.py                                          #
#   Project     : Advanced Comparch                                            #
#   Version     : 1.0                                                          #
#   Author      : Spiros Dontas                                                #
#   Email       : spirosdontas@gmail.com                                       #
#                                                                              #
#   Description : Download and install necessary files for exercise 1          #
#                                                                              #
################################################################################

import os, sys

def installTools() :
    HELPCODE = 'http://www.cslab.ece.ntua.gr/courses/advcomparch/files/askiseis/advanced-ca-Spring-2018-ask1-helpcode.tar.gz'
    PIN      = 'http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.6-97554-g31f0a167d-gcc-linux.tar.gz'
    PARSEC   = 'http://parsec.cs.princeton.edu/download/3.0/parsec-3.0-core.tar.gz'
    INPUTS   = 'http://parsec.cs.princeton.edu/download/3.0/parsec-3.0-input-sim.tar.gz'
# Download necessary files
    os.system('wget ' + HELPCODE)
    os.system('wget ' + PIN)
    os.system('wget ' + PARSEC)
    os.system('wget ' + INPUTS)
# Unpack the tar.gz
    tars = [f for f in os.listdir() if f.endswith('.tar.gz')]
    for tar in tars :
        os.system('tar xzvf ' + tar)
        os.system('rm ' + tar)
# Fix ugly names of helpcode and pin
    for component in os.listdir() :
        if (component.startswith('pin') and not(component.endswith('.tar.gz'))) :
            command = ['mv', component]
            command.append('-'.join(component.split('-')[0:2]))
            os.system(' '.join(command))
        if (component.endswith('helpcode')) :
            command = ['mv', component, 'ex1-helpcode']
            os.system(' '.join(command))

def installLibs() :
    PACKAGES = [
            'make',
            'g++',
            'libx11-dev',
            'libxext-dev',
            'libxaw7',
            'x11proto-xext-dev',
            'libglu1-mesa-dev',
            'libxi-dev',
            'libxmu-dev'
            ]
    CMD = ['sudo', 'apt', 'install']
    CMD.extend(PACKAGES)
    os.system(' '.join(CMD))

def makeParsec() :
    os.chdir('./parsec-3.0')
    os.system('../ex1-helpcode/cslab_process_parsec_benchmarks.sh')
    PACKAGES = [
            'blackscholes',
            'bodytrack',
            'canneal',
            'facesim',
            'ferret',
            'fluidanimate',
            'freqmine',
            'raytrace',
            'swaptions',
            'streamcluster'
            ]
    CMD = ['./bin/parsecmgmt', '-a', 'build', '-c', 'gcc-serial', '-p']
    CMD.extend(PACKAGES)
    os.system(' '.join(CMD))

def main(argv) :
    #  installTools()
    #  installLibs()
    makeParsec()

if __name__ == '__main__' :
    main(sys.argv)
