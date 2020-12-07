import os

from config import BASE_PATH


def run_bat(filename):
    path = BASE_PATH + os.sep + 'data' +os.sep +filename
    print(path)
    os.system(path)

if __name__ == '__main__':
    run_bat('clear_session.bat')