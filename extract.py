#!/usr/bin/env python3

# Extracts compressed file
# Works for tar.gz, tgz, rar, zip, tar.xz
# Unzips to current directory

# Todo: Add destination flag


import sys, os, argparse, subprocess
from os import path

parser = argparse.ArgumentParser()

parser.add_argument("fileExt", help="extension of file which to be extracted", choices=["tar.gz", "tar.xz", "tgz","zip", "rar"])
parser.add_argument("filePath", help="file path that to be extracted")

args = parser.parse_args()

currentDir = os.getcwd()  # Get where script was executed
filePath = path.join(currentDir, args.filePath)  # Get file path
filePath = path.abspath(filePath)  # Normalize it

if path.isfile(filePath) == False:
	sys.exit("No such file to extract") # No such file

if filePath.endswith(args.fileExt) == False:
	sys.exit("Extension doesn't match") # Extension mismatch

if args.fileExt in ["tar.gz","tgz", "tar.xz"]:
	subprocess.call("tar -xvf " + filePath, shell=True)
elif args.fileExt == "zip":
	subprocess.call("unzip " + filePath, shell=True)
elif args.fileExt == "rar":
	subprocess.call("unrar e " + filePath, shell=True)
