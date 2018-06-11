gcloud compute instances create instance1502 \
    --image debian-7 \
    --metadata startup-script='#!/bin/bash
        echo my_cloud_app_role=appserver \
                >/etc/facter/facts.d/role.txt'
