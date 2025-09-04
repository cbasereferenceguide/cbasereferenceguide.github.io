# Output

These commands control the information sent to the user.

Output MCI commands are handled properly during variable column output, ensuring that messages appear word-wrapped correctly, regardless of the length of a variable in the MCI command list.

### Commands
| Command | Description                    | String |
| :------ | :----------------------------- | :----- |
| £oa     | User's handle (username)       | na$    |
| £ob     | User's location                | yl$    |
| £oc     | User's phone number            | pn$    |
| £od     | User's real name               | rn$    |
| £oe     | User's access group            | gn$    |
| £of     | User's last login time         | lo$    |
| £og     | Name of the last caller        | lc$    |
| £oh     | Time of the last call          | tc$    |
| £oi     | Sysop availability status      | fg$    |
| £oj     | Sysop's handle (username)      | vi$    |
| £ok     | User's date of birth           | bd$    |
| £ol     | Current system date            | da$    |
| £om     | Current system time            | tm$    |
| £on     | User's computer type           | ct$    |
| £oo     | Last inputted line by the user | i$     |