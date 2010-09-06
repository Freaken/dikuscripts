import sys, os, os.path

def printcommand():
    user = "mathias"

    if len(sys.argv) != 3:
        print("Wrong number of parameters")
        return

    path = sys.argv[2]

    if not os.path.exists(path):
        print("File does not exist")
        return

    os.system("cat " + path + " | ssh " + user + "@ask.diku.dk lp -d m1b")
