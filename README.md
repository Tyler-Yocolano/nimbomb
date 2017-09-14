# Nimbomb
## Introduction
Nimbomb is a Giantbomb-wiki API wrapper for Nim.

### Requirements
#### Nim
Nim can be found at <https://nim-lang.org/>.
#### Giantbomb API Key
To use this module, you need to sign-up for an account on [Giant Bomb](https://www.giantbomb.com/). Then, go to the [API page](https://www.giantbomb.com/api) to sign up for an API Key.

### Installation
This module is not ready to be on nimble yet, so just unzip or clone it into your .nimble directory.

## Usage

### Before you start
An api key is required to use this module, it searches for a file called *giantbomb.api* in the current working directory.  The *giantbomb.api* file is just a .txt file with the api written on the first line.  If the file doesn't exist, you can still call the `setAPIKey(nimbomb: NimBombClient, key: string)` proc after creating your client.

### How-to
```nim
import nimbomb

var cli = newNimbombClient()

let results: seq[Resource] = cli.search("zelda")

for res in results:
    echo $res

let game: Resource = cli.get(results[0])

echo $game
```

This outputs:

```
Zelda's Adventure
The Legend of Zelda
The Legend of Zelda: The Wind Waker
The Legend of Zelda: Tetra's Trackers
The Legend of Zelda: Link's Awakening
The Legend of Zelda: Oracle of Ages
BS Zelda no Densetsu
Zelda II: The Adventure of Link
The Legend of Zelda: Ocarina of Time
The Legend of Zelda: A Link to the Past

Zelda's Adventure
```

Almost all resources can be read.

## To do
- Better documentation
- Support all resource types
- More convenient procs
