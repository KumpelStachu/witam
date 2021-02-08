from subprocess import run, DEVNULL
from os.path import isdir, isfile
try:
    import requests
except:
    from pip._internal import main as pip
    pip(['install', 'requests'])
    import requests

# print dziwnie się zachowuje
run(['echo', 'Python wita!'])

open('main.ts', 'wb').write(requests.get('https://kumpelstachu.github.io/witam/main.ts', allow_redirects=True).content)

exitCode = run(['which', 'node'], stdout=DEVNULL).returncode
if exitCode:
    run(['sudo', 'apt-get', 'install', '-y', 'nodejs', 'npm'], stdout=DEVNULL)
    run(['sudo', 'npm', 'i', 'npm', '-g'], stdout=DEVNULL)

exitCode = run(['which', 'ts-node'], stdout=DEVNULL).returncode
if exitCode:
    run(['sudo', 'npm', 'install', '-g', 'ts-node'], stdout=DEVNULL)

if not isfile('package.json'):
    run(['npm', 'init', '-y'], stdout=DEVNULL)

if not isdir('node_modules'):
    run(['npm', 'i', '@types/node'], stdout=DEVNULL)

run(['ts-node', 'main.ts'])
