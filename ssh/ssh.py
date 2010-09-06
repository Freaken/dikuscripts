import sys, os, os.path, conf

def ssh():

    host = "ask"

    if len(sys.argv) == 3:
    # Lav check af om det er et gyldigt navn
        host = sys.argv[2]


    if host == "tuxray":
        #TODO
        os.system("ssh -Y " + conf.diku_brugernavn + "@")

    else:
        os.system("ssh -Y " + conf.diku_brugernavn + "@" + host + ".diku.dk")

