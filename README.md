Ansible setup cobbler
=============================


test - da li ansible odgovara:
     ansible  -i ansible_hosts -m ping all
     ansible  -m ping cobbler


Zeljeni odgovor:

    cobbler | success >> {
       "changed": false,
        "ping": "pong"
    }
