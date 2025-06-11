#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
  X(" ", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2", 0, 5) \
  X("", "curl wttr.in/Uppsala?format='+%c%t+%w'", 120, 1) \
  X(" ", "cat /sys/class/power_supply/BAT0/capacity", 30, 1) \
  X(" ", "date '+%d/%m/%y %H:%M'", 5, 1)

#endif  // CONFIG_H
