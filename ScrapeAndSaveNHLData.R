# Downloads and save nhl game data via the nhlscrpr package.

# Bring in the package.
library(nhlscrapr)

# Patch the package.
source("nhlscraprUpdate.R")

# New index for extra.season = 0 is 2016-2017.
# Create empty game database.
all_games <- full.game.database(extra.seasons = 0)
    
# Specify download season.
download.season <- "20162017"

# Determine subset of game IDs for the season.
game_ids = subset(all_games, season == download.season)

# Download and process the data
dummy = download.games(games = game_ids, wait = 5)
process.games(games=game_ids,override.download=FALSE)

# Garbage collection.
gc()

# Compile all of the game data files into a single one.
compile.all.games(output.file= paste("./_data/nhlscrapr-",download.season,".RData", sep = ""))
