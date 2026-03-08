# Sicherheitsübersicht: Authentication auf Ubuntu absichern

## 1. Passwort-Qualität erzwingen

Ubuntu nutzt für Passwortregeln typischerweise `pam_pwquality`. Die systemweiten Regeln werden über `libpwquality` in `/etc/security/pwquality.conf` gesetzt. 

```bash
sudo apt update
sudo apt install libpam-pwquality
```

### Konfiguration anpassen

`sudo nano /etc/security/pwquality.conf`

### Prüfen, ob PAM das Modul nutzt
`sudo nano /etc/pam.d/common-password`
Dort sollte eine Zeile mit `pam_pwquality.so` oder eine Einbindung der pwquality-Prüfung vorhanden sein. Das Modul ist genau für die Passwortstärkeprüfung im Passwort-Stack gedacht. 

Ein typisches Beispiel sieht so aus:

`password requisite pam_pwquality.so retry=3`

## 2. Passwort-Historie aktivieren

