# Color
These commands change the text color for users who are not on a PETSCII machine but want to add color to their messages.

Unlike other commands, MCI commands are handled in the input parser instead of the output routine. This allows the command to take effect as soon as it is typed, with the result shown immediately. ANSI users can see the current color they are typing in without running a separate MCI read of the message.

### Commands
| Command | Description       |
| :------ | :---------------- |
| £ca     | White             |
| £cb     | Red               |
| £cc     | Cyan              |
| £cd     | Purple            |
| £ce     | Green             |
| £cf     | Blue              |
| £cg     | Yellow            |
| £ch     | Orange [^1]       |
| £ci     | Brown             |
| £cj     | Light Red         |
| £ck     | Dark Grey [^2]    |
| £cl     | Medium Grey       |
| £cm     | Light Green       |
| £cn     | Light Blue        |
| £co     | Light Grey        |
| £cp     | Reverse Video On  |
| £cq     | Reverse Video Off |

 [^1]: Dark Purple in ANSI, and 128-80 column mode
 [^2]: Dark Cyan in ANSI, and 128-80 column mode
