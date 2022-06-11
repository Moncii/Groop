# Groop
Groop provides a simple way to orginize, manage, and load assets.

## Installation
```lua
assets = require "groop"
```
## Ussage
### Loading Assets
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
```lua
 function love.load()
 
  assets.load()
 
 end
```
