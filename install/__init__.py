import sys

print(sys.argv[2])
if sys.argv[2] == "mosml":
    from install.mosml import *
    mosml.install()

