# Groop
Groop provides a simple way to orginize, manage, and load assets.

## Installation
```lua
assets = require "groop"
```
## Ussage
Groop looks for a root assets folder, which by default is defined as "Assets".
It then looks for folders containing files that associated with a certain asset type.
The default asset types are "images", "sounds", and "fonts".
By default Groop looks for these assets in the respective "Images", "Sounds", and "Fonts" folders.
The default file structure Groop will look for is:
```
├── Assets
   ├── Images
   ├── Sounds
   ├── Fonts
```
However, it is possible to redefine the root assets folder, existing asset types, and to add new asset types.
### assets.load()
This loads in all the provided files and creates their respective assets.
```lua
 function love.load()
 
  assets.load()
 
 end
```
### assets.get(type, name)
Retrieve an asset for use.
```lua
assets.get(type, name)
```
Example:
```lua
love.graphics.draw(assets.get("images", "player"), 0, 0)
```
### assets.define(type, directory, extensions, process)
Redefine the root assets folder, existing asset types, or add new asset types.
```lua
assets.define(type, directory, extensions, process)
```
#### Examples:
