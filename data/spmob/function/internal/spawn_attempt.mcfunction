# Spawn attempt process
# Probability check and spawn if successful

# Generate UUID random number (0-99 range)
summon minecraft:marker ~ ~ ~ {Tags:["spmob.random"]}
execute store result score #global spmob.temp run data get entity @e[type=minecraft:marker,tag=spmob.random,limit=1] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.random]

# Convert negative to positive
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# Fit to 0-99 range
scoreboard players operation #global spmob.temp %= #global spmob.const

# DEBUG: Log random value and probability
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Random: ","color":"yellow"},{"score":{"name":"#global","objective":"spmob.temp"},"color":"aqua"},{"text":" / Probability: ","color":"yellow"},{"score":{"name":"#global","objective":"spmob.config.probability"},"color":"aqua"}]

# Probability check (spawn if random < probability)
execute if score #global spmob.temp < #global spmob.config.probability run function spmob:internal/do_spawn
