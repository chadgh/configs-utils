#!/usr/bin/python
import sys
import argparse

from plumbum import local
local = local

def getArgParser(program=__file__, desc=''):
    """Generates a default argparser for command line python scripts."""
    parser = argparse.ArgumentParser(prog=program, description=desc)
    parser.add_argument('-v', '--verbose', action='store_true', default=False, help="display actual commands executed")
    parser.add_argument('-t', '--test', action='store_true', default=False, help="display actual commands executed, but don't execute")
    return parser
