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
## assets.load()
This loads in all the provided files and creates their respective assets.
```lua
function love.load()

   assets.load()

end
```
## assets.get(type, name)
Retrieve an asset for use.
```lua
assets.get(type, name)
```
### Example:
```lua
love.graphics.draw(assets.get("images", "player"), 0, 0)
```
## assets.define(type, directory, extensions, process)
Redefine the root assets folder, existing asset types, or add new asset types.
This must be called before assets.load()
```lua
assets.define(type, directory, extensions, process)
```
### Examples:
Define the root assets folder as a folder called "Resources".
```lua
assets.define("assets", "Resources")
```
Set the "images" asset type to look for files in a folder called "Sprites", and to only accept files with a .png or .jpg extension.
```lua
assets.define("images", "Sprites", {".png", ".jpg"})
```
## Processes
All asset types have a process function that gets called when an asset is created.
It creates an asset, applies any wanted modification, and the returns it to be stored.
The default process function for sounds looks like this:
```lua
function(file)
   local asset = love.audio.newSource(file, "static")
   return asset
end
```
