# PETSCII control codes

Control codes recognized by the `.seq` decoder.

## Row terminators

| Code  | Meaning      | Behavior                 |
| :---- | :----------- | :----------------------- |
| `$0D` | Return       | Flush row, start new row |
| `$8D` | Shift+Return | Flush row, start new row |
| `$88` | F7           | Flush row, start new row |

When any row terminator immediately follows an auto-wrap (a row that reached the column limit), the terminator is ignored to prevent a spurious blank row. All three codes are handled identically.

`$88` is the F7 key code. C\*Base uses it as a soft line break in message text — the BBS inserts it at word boundaries to wrap long lines before sending them to the terminal.

## Color codes

| Code  | Color       | Index |
| :---- | :---------- | :---- |
| `$90` | Black       | 0     |
| `$05` | White       | 1     |
| `$1C` | Red         | 2     |
| `$9F` | Cyan        | 3     |
| `$9C` | Purple      | 4     |
| `$1E` | Green       | 5     |
| `$1F` | Blue        | 6     |
| `$9E` | Yellow      | 7     |
| `$81` | Orange      | 8     |
| `$95` | Brown       | 9     |
| `$96` | Light Red   | 10    |
| `$97` | Dark Grey   | 11    |
| `$98` | Grey        | 12    |
| `$99` | Light Green | 13    |
| `$9A` | Light Blue  | 14    |
| `$9B` | Light Grey  | 15    |

Color codes change the foreground color for all subsequent characters until another color code is encountered. The initial default foreground is Light Blue (index 14).

## Special codes

| Code  | Meaning      | Behavior                                                    |
| :---- | :----------- | :---------------------------------------------------------- |
| `$12` | Reverse ON   | Characters drawn with foreground and background swapped     |
| `$92` | Reverse OFF  | Normal character drawing resumes                            |
| `$93` | Clear Screen | CLS boundary; optional green line when Show CLS ($93) is on |

## Stripped codes

The following codes are consumed silently and produce no output:

`$00` NUL, `$03` RUN/STOP, `$0A` LF, `$08` C=-Shift disable, `$09` C=-Shift enable, `$0E` lowercase charset switch, `$0F` unused, `$11` cursor down, `$13` Home, `$17` cursor right variant, `$1D` cursor right, `$8E` uppercase charset switch, `$85`–`$87` F1–F3, `$89`–`$8C` F5–F8, `$91` cursor up, `$94` Insert, `$9D` cursor left.

Any other byte in the control range (`< $20` or `$80`–`$9F`) not listed above is rendered as a placeholder middle-dot character (`·`).

---

## See also

- [MCI commands](mci-commands.md)
- [.seq viewer controls](../viewer-controls/seq-viewer.md)
