Ansible setup cobbler
=============================


test - da li ansible odgovara:
     ansible  -i ansible_hosts -m ping all
     ansible  -m ping cobbler
     ansible cobbler -m setup | grep ipv4 -A4

Zeljeni odgovor:

    cobbler | success >> {
       "changed": false,
        "ping": "pong"
    }
