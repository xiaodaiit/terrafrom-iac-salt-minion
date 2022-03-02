#cloud-config
bootcmd:
    - [ sh, -xc, "echo $(date) ': start yum repo'" ]
    - [ sh, -xc, "rpm --import https://repo.saltproject.io/py3/redhat/7/x86_64/latest/SALTSTACK-GPG-KEY.pub" ]
    - [ sh, -xc, "curl -fsSL https://repo.saltproject.io/py3/redhat/7/x86_64/latest.repo | tee /etc/yum.repos.d/salt.repo" ]


salt_minion:
    pkg_name: 'salt-minion'
    service_name: 'salt-minion'
    config_dir: '/etc/salt'
    conf:
        master: ${master_id}
    grains:
        role:
            - ${role}

