# full-border.yazi

Add a full border to Yazi to make it look fancier with support for multiple border styles including double lines, heavy/thick variants, and more!

![full-border](https://github.com/yazi-rs/plugins/assets/17523360/ef81b560-2465-4d36-abf2-5d21dcb7b987)

## Installation

```sh
ya pkg add yazi-rs/plugins:full-border
```

## Usage

Add this to your `init.lua` to enable the plugin:

```lua
require("full-border"):setup()
```

### Border Styles

You can customize the border style with the `style` parameter:

```lua
require("full-border"):setup {
	style = "double",  -- Choose your preferred border style
}
```

#### Available Styles

| Style | Description | Preview |
|-------|-------------|---------|
| `"rounded"` | Rounded corners (default) | `╭─╮╰─╯` |
| `"plain"` | Plain/sharp corners | `┌─┐└─┘` |
| `"double"` | Double line borders | `╔═╗╚═╝` |
| `"heavy"` | Heavy/thick borders | `┏━┓┗━┛` |
| `"heavy-double"` | Heavy vertical with double junction | `┏━┓┗━┛` with `┿` junctions |
| `"ascii"` | ASCII-only borders (for compatibility) | `+-++-+` |
| `"block"` | Solid block borders | `███` |
| `"double-rounded"` | Rounded corners with double lines | `╭═╮╰═╯` |

### Examples

**Double line borders:**
```lua
require("full-border"):setup {
	style = "double",
}
```

**Heavy/thick borders:**
```lua
require("full-border"):setup {
	style = "heavy",
}
```

**ASCII-only (for limited terminal support):**
```lua
require("full-border"):setup {
	style = "ascii",
}
```

### Backwards Compatibility

The old `type` parameter is still supported for backwards compatibility:

```lua
require("full-border"):setup {
	-- Still works, but prefer using 'style' for new configurations
	type = ui.Border.ROUNDED,
}
```

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
