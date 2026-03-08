# Setting up Password Policy on Ubuntu 24.04
Ubuntu setzt für Authentifizierung auf **PAM (Pluggable Authentication Modules)**. Für Passwortregeln wird heute meist `pam_pwquality` verwendet. Damit lassen sich beim **Ändern von Passwörtern** Mindestlänge, Komplexität, Ähnlichkeit zum alten Passwort und weiter Anforderungen erzwingen. Wichtig: Die Prüfung greift **nur bei Passwortänderungen über PAM** wie `passwd`, nciht wenn Root ein Passwort direkt setzt. 

Die wichtigsten Dateien sind:
- `/etc/pam.d/common-password` -> steuert die PAM-Passwortkette
- `/etc/security/pwquality.conf` -> enthält die eigentlichen Passwortregeln

Empfohlen ist, die Regeln vor allem in `pwquality.conf` zu definieren und die PAM-Zeile schlank zu halten

Beispeilkonfiguration:

```
# /etc/security/pwquality.conf

# Minimum password length (14 characters is a common enterprise baseline)
minlen = 14

# Minimum number of character classes required (lowercase, uppercase, digits, special)
# A value of 3 means at least 3 different classes must be present
minclass = 3

# Maximum credit for uppercase letters
# Negative value means this many uppercase chars are REQUIRED
ucredit = -1

# Maximum credit for lowercase letters
lcredit = -1

# Maximum credit for digits
dcredit = -1

# Maximum credit for other characters (special characters)
ocredit = -1

# Reject passwords containing the user's account name
usercheck = 1

# Reject passwords similar to old password (0 disables, higher = stricter)
difok = 5

# Maximum consecutive repeated characters allowed
maxrepeat = 3

# Maximum consecutive characters from same character class
maxclassrepeat = 4

# Check the password against a dictionary of common words
dictcheck = 1

# Reject passwords containing words 3 or more characters long from the user's GECOS field
gecoscheck = 1

# Number of attempts before returning an error
retry = 3

# Enforce rules even for root (0 = root can bypass, 1 = root must comply)
enforce_for_root = 1

```

