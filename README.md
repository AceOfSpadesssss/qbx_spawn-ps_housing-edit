## Edited qbx_spawn to make it work with ps-housing!
Just a personal edit here since I saw many people asking for it in the discord.

### Installation
1. Download repo
2. Rename repo to ``qbx_spawn``
3. Replace your existing ``qbx_spawn`` with the new
4. Go in ``qbx_spawn/server/main.lua`` and edit the following to match your ps-housing starting appartments:
```
local ps_starters = {
    -- ["Name of Starting appartment"] = vector3(0, 0, 0)
    ["Motel"] = vector3(325.14, -229.54, 54.21)
}

```
^^ This was needed for the coords of all the starting appartments to show correctly on the map since ps-housing gets their coords from the config and not database!
