# GRUB-Bootloader mit Passwort absichern

## Vorgehen

### 1. Passwort Hash erzeugen
Mit folgendem Befehl wird ein sicherer Passwort-Hash für GRUB erstellt:

```
sudo grub-mkpasswd-pdkdf2
```

Danach gibst du dein gewünschtes Passwort zweimal ein. Am Ende erhälst du einen Hash in etwa dieser Form.

```
grub.pbkdf2.sha512.10000.xxxxxxxxxxx
```

Diesen Hash musst du kopieren

### 2. GRUB-Konfiguraiton anpassen
Bearbeite die Datei:

```
sudo nano /etc/grub.d/40_custom
```

Füge dort diese Zeilen ein:

```
set superusers="your_username"
password_pbkdf2 your_username [dein_hash]
```

- `your_username` durch den gewünschten Benutzernamen ersetzen
- `[dein_hash]` durch den zuvor erzeugten Hash ersetzen

Dann Datei speichern und schließen.

### 3. Grub aktualisieren
Damit die Änderung übernommen wird:
```
sudo update-grub
```
Ergebnis

Nach einem Neustart ist GRUB mit einem Passwort geschützt.
Dadurch wird verhindert, dass Unbefugte einfach Boot-Einstellungen verändern.

